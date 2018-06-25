package com.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * httpclient工具类，处理http请求
 * 
 * @author silverhu
 *
 */
public class HttpClientUtil {

	private static Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);

	/**
	 * 发送Get请求：发送JSON格式数据
	 * 
	 * @param url
	 *            URL
	 * @param sendData
	 *            JSON格式参数
	 * @return
	 */
	public static String sendHttpGetJosn(String url) {
		Map<String, String> getheaders = new HashMap<String, String>();
		getheaders.put("Accept", ContentType.APPLICATION_JSON.toString());
		return sendHttpGetRequest(url, getheaders);
	}

	/**
	 * 发送GET请求
	 * 
	 * @param url
	 *            请求URL
	 * @param headers
	 *            请求头
	 * @return
	 */
	public static String sendHttpGetRequest(String url) {
		return HttpClientUtil.sendHttpGetRequest(url, null);
	}

	/**
	 * 发送GET请求
	 * 
	 * @param url
	 *            请求URL
	 * @param headers
	 *            请求头
	 * @return
	 */
	public static String sendHttpGetRequest(String url, Map<String, String> headers) {
		return HttpClientUtil.sendHttpGetRequest(url, headers, -1);
	}

	/**
	 * 发送GET请求
	 * 
	 * @param url
	 *            请求URL
	 * @param headers
	 *            请求头
	 * @param timeout
	 *            超时，-1不设置超时
	 * @return
	 */
	public static String sendHttpGetRequest(String url, Map<String, String> headers, int timeout) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(url);
		HttpClientUtil.setHttpConfig(httpGet, headers, timeout);
		return HttpClientUtil.executeHttpRequest(httpClient, httpGet);
	}

	/**
	 * 发送Post请求：发送JSON格式数据
	 * 
	 * @param url
	 *            URL
	 * @param sendData
	 *            JSON格式参数
	 * @return
	 */
	public static String sendHttpPostJosn(String url, String sendData) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		if (sendData != null && !"".equals(sendData)) {
			StringEntity entity = new StringEntity(sendData, "UTF-8");
			entity.setContentType(ContentType.APPLICATION_JSON.toString());
			httpPost.setEntity(entity);
		}

		return executeHttpRequest(httpClient, httpPost);
	}

	/**
	 * 发送Post请求：上传单个文件
	 * 
	 * @param url
	 *            请求URL
	 * @param inputname
	 *            文件对应的表单name
	 * @param file
	 *            上传文件
	 * @param fileType
	 *            文件类型，为空则默认，图片类型"image/jpeg"
	 * @return
	 */
	public static String sendHttpPostFile(String url, String inputname, File file, String fileType) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(inputname, file);

		Map<String, String> fileTypes = new HashMap<String, String>();
		fileTypes.put(inputname, fileType);

		// 发送请求
		return sendHttpPostFile(url, params, fileTypes);

	}

	/**
	 * post binary请求
	 * @param url
	 * @param bytes
	 * @return
	 */
	public static byte[] sendHttpPostBinary(String url, byte[] bytes) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);

		// 对二进制文件填充
		InputStreamEntity entity = new InputStreamEntity(new ByteArrayInputStream(bytes));
		entity.setContentType("binary/octet-stream");
		httpPost.setEntity(entity);
		return executeHttpBinaryRequest(httpClient, httpPost);
	}

	/**
	 * 发送Post请求：模拟表单（上传文件）提交
	 * 
	 * @param url
	 *            请求URL
	 * @param params
	 *            参数（key为表单项name，value为值），上传文件为File类型
	 * @param fileTypes
	 *            文件参数（key为文件name，value为文件类型），图片类型为image/jpeg，为空或不存在则为默认类型
	 * @return
	 */
	public static String sendHttpPostFile(String url, Map<String, Object> params, Map<String, String> fileTypes) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);

		// 对请求的表单域进行填充
		MultipartEntityBuilder multipartBuilder = MultipartEntityBuilder.create();
		multipartBuilder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);

		// 填充普通参数
		if (params != null) {
			for (String key : params.keySet()) {
				if (params.get(key) instanceof File) {
					if (!fileTypes.containsKey(key)) {
						// 普通文件类型
						multipartBuilder.addPart(key, new FileBody((File) params.get(key)));
					} else {
						// 特殊文件类型
						multipartBuilder.addPart(key,
								new FileBody((File) params.get(key), ContentType.create(fileTypes.get(key)), null));
					}
				} else {
					multipartBuilder.addTextBody(key, params.get(key).toString());
				}
			}
		}

		httpPost.setEntity(multipartBuilder.build());

		// 发送请求
		return executeHttpRequest(httpClient, httpPost);
	}

	/**
	 * 发送基本Post请求
	 * 
	 * @param url
	 *            请求URL
	 * @param params
	 *            参数
	 * @return
	 */
	public static String sendHttpPostRequest(String url, Map<String, String> params) {
		return HttpClientUtil.sendHttpPostRequest(url, params, null);
	}

	/**
	 * 发送基本Post请求
	 * 
	 * @param url
	 *            请求URL
	 * @param params
	 *            参数
	 * @param headers
	 *            请求头
	 * @return
	 */
	public static String sendHttpPostRequest(String url, Map<String, String> params, Map<String, String> headers) {
		return HttpClientUtil.sendHttpPostRequest(url, params, headers, -1);
	}

	/**
	 * 发送基本Post请求
	 * 
	 * @param url
	 *            请求URL
	 * @param params
	 *            参数
	 * @param headers
	 *            请求头
	 * @param timeout
	 *            超时，-1不设置超时
	 * @return
	 */
	public static String sendHttpPostRequest(String url, Map<String, String> params, Map<String, String> headers,
			int timeout) {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		HttpClientUtil.setHttpConfig(httpPost, headers, timeout);

		if (params != null && !params.isEmpty()) {
			// 创建input = text参数队列
			List<NameValuePair> formParams = new ArrayList<NameValuePair>();
			for (Map.Entry<String, String> entry : params.entrySet()) {
				formParams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
			try {
				httpPost.setEntity(new UrlEncodedFormEntity(formParams, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				logger.error("httpPost 设置Entity error:", e);
			}
		}

		return HttpClientUtil.executeHttpRequest(httpClient, httpPost);
	}

	/**
	 * 设置request
	 * 
	 * @param headers
	 *            请求头信息
	 * @param timeout
	 *            超时时间，-1不设置超时
	 * @param httpRequest
	 *            请求对象
	 */
	public static void setHttpConfig(HttpRequestBase httpRequest, Map<String, String> headers, int timeout) {
		// 设置超时
		if (timeout >= 0) {
			RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(timeout).setSocketTimeout(timeout)
					.build();
			httpRequest.setConfig(requestConfig);
		}
		// 设置头
		if (headers != null) {
			for (String name : headers.keySet()) {
				httpRequest.setHeader(name, headers.get(name));
			}
		}
	}

	/**
	 * 执行http请求
	 * 
	 * @param httpClient
	 *            http客户端
	 * @param http
	 *            http请求
	 * @return
	 */
	public static String executeHttpRequest(CloseableHttpClient httpClient, HttpRequestBase httpRequest) {
		CloseableHttpResponse response = null;
		String responseContent = null;
		try {
			response = httpClient.execute(httpRequest);
			HttpEntity entity = response.getEntity();

			if (null != entity) {
				responseContent = EntityUtils.toString(entity, "UTF-8");
				EntityUtils.consume(entity); // 关闭content stream
			}

			response.close();
		} catch (ClientProtocolException e) {
			logger.error("该异常通常是协议错误导致,比如构造HttpGet对象时传入的协议不对(将'http'写成'htp')或者服务器端返回的内容不符合HTTP协议要求等,堆栈信息如下" + e);
		} catch (IOException e) {
			logger.error("该异常通常是网络原因引起的,如HTTP服务器未启动等,堆栈信息如下" + e);
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				httpClient.close();
			} catch (IOException e) {
				logger.debug("HttpClient关闭异常" + e);
			}
		}

		logger.debug(httpRequest.getURI() + "：response=" + responseContent);
		return responseContent;
	}
	
	/**
	 * 执行http请求
	 * 
	 * @param httpClient
	 *            http客户端
	 * @param http
	 *            http请求
	 * @return
	 */
	public static byte[] executeHttpBinaryRequest(CloseableHttpClient httpClient, HttpRequestBase httpRequest) {
		CloseableHttpResponse response = null;
		byte[] responseContent = null;
		try {
			response = httpClient.execute(httpRequest);
			HttpEntity entity = response.getEntity();

			if (null != entity) {
				responseContent = EntityUtils.toByteArray(entity);
				EntityUtils.consume(entity); // 关闭content stream
			}

			response.close();
		} catch (ClientProtocolException e) {
			logger.error("该异常通常是协议错误导致,比如构造HttpGet对象时传入的协议不对(将'http'写成'htp')或者服务器端返回的内容不符合HTTP协议要求等,堆栈信息如下" + e);
		} catch (IOException e) {
			logger.error("该异常通常是网络原因引起的,如HTTP服务器未启动等,堆栈信息如下" + e);
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				httpClient.close();
			} catch (IOException e) {
				logger.debug("HttpClient关闭异常" + e);
			}
		}

		logger.debug(httpRequest.getURI() + "：response=" + new String(responseContent));
		return responseContent;
	}


}
