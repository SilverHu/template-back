/**
 * 
 */
package com.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * It is a tool class to operate file.Can not create new instance.Including
 * transfer file from a path to other path or page.
 * 
 * @author SilverHu
 * @dependency org.apache.poi 3.14
 * 
 */
public class FileUtil {
	private final static Logger log = LoggerFactory.getLogger(FileUtil.class);
	private final static String DEFAULT_SHEETNAME = "Sheet1";

	private FileUtil() {

	}

	/**
	 * 切图
	 * 
	 * @param oldImg
	 *            原始图
	 * @param newImg
	 *            目标图
	 * @param width
	 *            宽度
	 * @param height
	 *            高度
	 * @param rect
	 *            目标图输出的格式
	 * @throws IOException
	 */
	public static void cutImg(String oldImg, String newImg, int width, int height, Rectangle rect) throws IOException {
		Image image = ImageIO.read(new File(oldImg));
		BufferedImage bImage = makeThumbnail(image, width, height);

		saveSubImage(bImage, rect, new File(newImg));
	}

	/**
	 * @Description: 对BufferImage按照(x, y, width, height) = (subImageBounds.x,
	 *               subImageBounds.y, subImageBounds.width,
	 *               subImageBounds.height)进行裁剪
	 *               如果subImageBounds范围过大，则用空白填充周围的区域。
	 * 
	 * @param image
	 * @param subImageBounds
	 * @param destImageFile
	 * @throws IOException
	 * @author SilverHu
	 */
	private static void saveSubImage(BufferedImage image, Rectangle subImageBounds, File newImg) throws IOException {
		if (!newImg.exists()) {
			newImg.createNewFile();
		}
		String fileName = newImg.getName();
		String formatName = fileName.substring(fileName.lastIndexOf('.') + 1);
		BufferedImage subImage = new BufferedImage(subImageBounds.width, subImageBounds.height, 1);
		Graphics g = subImage.getGraphics();

		if ((subImageBounds.width > image.getWidth()) || (subImageBounds.height > image.getHeight())) {
			int left = subImageBounds.x;
			int top = subImageBounds.y;
			if (image.getWidth() < subImageBounds.width)
				left = (subImageBounds.width - image.getWidth()) / 2;
			if (image.getHeight() < subImageBounds.height)
				top = (subImageBounds.height - image.getHeight()) / 2;
			g.setColor(Color.white);
			g.fillRect(0, 0, subImageBounds.width, subImageBounds.height);
			g.drawImage(image, left, top, null);
			ImageIO.write(image, formatName, newImg);
		} else {
			g.drawImage(
					image.getSubimage(subImageBounds.x, subImageBounds.y, subImageBounds.width, subImageBounds.height),
					0, 0, null);
		}
		g.dispose();
		ImageIO.write(subImage, formatName, newImg);
	}

	/**
	 * @Description: 对原始图片根据(x, y, width, height) = (0, 0, width,
	 *               height)进行缩放，生成BufferImage
	 * @param img
	 * @param width
	 *            预处理后图片的宽度
	 * @param height
	 *            预处理后图片高度
	 * @return
	 * @author SilverHu
	 * @throws IOException
	 */
	private static BufferedImage makeThumbnail(Image img, int width, int height) throws IOException {
		BufferedImage tag = new BufferedImage(width, height, 1);
		Graphics g = tag.getGraphics();
		g.drawImage(img.getScaledInstance(width, height, 4), 0, 0, null);

		g.dispose();
		return tag;
	}

	/**
	 * Park files whit ZIP or RAR
	 * 
	 * @param rarFile
	 *            : save file name
	 * @param files
	 *            : operate file list
	 */
	public static void packFile(String rarFile, List<File> files) {
		OutputStream outFile = null;
		ZipOutputStream outZip = null;

		try {
			// create RAR file
			File zip = new File(rarFile);
			FileUtil.createFile(zip);

			// create ZipOutupStream
			outFile = new FileOutputStream(zip);
			outZip = new ZipOutputStream(outFile);

			// package
			for (File file : files) {
				FileUtil.packOneFile(outZip, file, null);
			}
		} catch (IOException e) {
			log.error("Park files with ZIP filed!", e);
		} finally {
			/* close IO stream */
			try {
				if (outZip != null) {
					outZip.flush();
					outZip.close();
				}
				if (outFile != null) {
					outFile.flush();
					outFile.close();
				}
			} catch (IOException e) {
				log.error("IO Exception!", e);
			}
		}

	}

	/**
	 * write file into ZIP
	 * 
	 * @param outZip
	 * @param file
	 * @param parentName
	 *            : parent file name
	 */
	public static void packOneFile(ZipOutputStream outZip, File file, String parentName) {
		InputStream inFile = null;
		try {
			// If file is a file ,package it; if a directory, get children
			// file,use this function again.
			if (file.isFile()) {
				// create FileInputStream
				inFile = new FileInputStream(file);

				// create next file while it will be parked to ZIP
				ZipEntry entry = new ZipEntry(
						parentName == null ? file.getName() : parentName + File.separator + file.getName());
				outZip.putNextEntry(entry);

				// write file to ZIP
				byte[] byteArr = new byte[1024];
				while (inFile.read(byteArr) != -1) {
					outZip.write(byteArr);
				}
			} else if (file.isDirectory()) {
				// get children from file
				File[] fileArr = file.listFiles();
				for (File f : fileArr) {
					packOneFile(outZip, f, file.getName());
				}
			}
		} catch (FileNotFoundException e) {
			log.error("File is not found!", e);
		} catch (IOException e) {
			log.error("IO Exception!", e);
		} finally {
			/* close IO stream */
			try {
				if (inFile != null) {
					inFile.close();
				}
			} catch (IOException e) {
				log.error("IO Exception!", e);
			}
		}
	}

	/**
	 * batch write data to excel
	 * 
	 * @param file
	 *            excel file
	 * @param sheetname
	 *            if null, will use default value
	 * @param data
	 * 
	 */
	public static void writeExcel(File file, String sheetname, List<List<String>> data) {
		if (data == null || data.isEmpty()) {
			return;
		}
		if (StringUtils.isBlank(sheetname)) {
			sheetname = DEFAULT_SHEETNAME;
		}

		InputStream in = null;
		OutputStream out = null;
		Workbook workbook = null;
		try {
			// 创建工作表
			in = new FileInputStream(file);
			if (file.getName().endsWith(".xls") || file.getName().endsWith(".xlsx")) {
				workbook = new HSSFWorkbook(in);
			} else {
				log.error("file is not xls!");
			}

			Sheet sheet = workbook.getSheet(sheetname);
			if (sheet == null) {
				sheet = workbook.createSheet(sheetname);
			}

			// 写入数据，rownum从0开始，没有也是0
			int rownum = sheet.getLastRowNum();
			if (rownum == 0 && sheet.getRow(0) == null) {
				rownum = -1;
			}
			for (int i = 0; i < data.size(); i++) {
				Row row = sheet.createRow(rownum + i + 1);
				List<String> rowData = data.get(i);
				for (int j = 0; j < rowData.size(); j++) {
					row.createCell(j).setCellValue(rowData.get(j));
				}
			}
			out = new FileOutputStream(file);
			workbook.write(out);
		} catch (FileNotFoundException e) {
			log.error("file is not found!", e);
		} catch (IOException e) {
			log.error("write date to excel is failed!", e);
		} finally {
			try {
				if (workbook != null) {
					workbook.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				log.error("close stream is error!", e);
			}
		}
	}

	public static void main(String[] args) {
		String filename = "D:/test.xls";
		createExcel(filename, "工作表");
		List<List<String>> data = new ArrayList<List<String>>();
		List<String> titles0 = new ArrayList<String>();
		titles0.add("test0");
		titles0.add("test0");
		titles0.add("test0");
		data.add(titles0);
		List<String> titles1 = new ArrayList<String>();
		titles1.add("test1");
		titles1.add("test1");
		titles1.add("test1");
		data.add(titles1);
		writeExcel(new File(filename), "工作表", data);
	}

	/**
	 * This function transfer file form filePath to savePath.
	 * 
	 * @param filePath
	 *            : filePath is the path of operating file, including catalog
	 *            name and file name.
	 * @param savePath
	 *            : savePath is the path of saving, including catalog name and
	 *            file name.
	 */
	public static void transferFile(File file, String savePath) {

		InputStream in = null;
		OutputStream out = null;
		try {
			/* download file */
			in = new FileInputStream(file);

			/* create file */
			File saveFile = new File(savePath);
			FileUtil.createFile(saveFile);

			/* upload file */
			out = new FileOutputStream(saveFile);
			byte[] byteArr = new byte[1024];
			int readSize = 0;
			while ((readSize = in.read(byteArr)) != -1) {
				out.write(byteArr, 0, readSize);
			}

		} catch (FileNotFoundException e) {
			log.error("file is not found!", e);
		} catch (IOException e) {
			log.error("save file is file!", e);
		} finally {
			/* close IO stream */
			try {
				if (out != null) {
					out.flush();
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				log.error("IO stream close failed!", e);
			}
		}
	}

	/**
	 * Download file form filePath to page, it use response take OutputStream to
	 * page.
	 * 
	 * @param filePath
	 *            : operating file.
	 * @param response
	 *            : use it take OutputStream to page.
	 */
	public static void download(File file, HttpServletResponse response) {
		InputStream in = null;
		OutputStream out = null;
		try {
			/* download file */
			in = new FileInputStream(file);

			/* upload file */
			out = response.getOutputStream();
			byte[] byteArr = new byte[1024];
			int readSize = 0;
			while ((readSize = in.read(byteArr)) != -1) {
				out.write(byteArr, 0, readSize);
			}

		} catch (FileNotFoundException e) {
			log.error("file is not found!", e);
		} catch (IOException e) {
			log.error("download file is failed!", e);
		} finally {
			/* close IO stream */
			try {
				if (out != null) {
					out.flush();
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				log.error("IO stream close failed!", e);
			}
		}
	}

	/**
	 * create excel file, if file is exists, will remove file, and create a new
	 * file
	 * 
	 * @param filepath
	 *            all file path
	 * @param sheetname
	 *            a sheet name, must exists
	 */
	public static void createExcel(String filepath, String sheetname) {
		if (StringUtils.isBlank(sheetname)) {
			sheetname = DEFAULT_SHEETNAME;
		}

		// 存在则删除
		if (new File(filepath).exists()) {
			removeFile(filepath);
		}
		OutputStream out = null;
		HSSFWorkbook workbook = new HSSFWorkbook();
		try {
			out = new FileOutputStream(filepath);
			workbook.createSheet(sheetname);
			workbook.write(out);
		} catch (FileNotFoundException e) {
			log.error("error is not found!", e);
		} catch (IOException e) {
			log.error("create excel is failed!", e);
		} finally {
			/* close IO stream */
			try {
				if (workbook != null) {
					workbook.close();
				}
				if (out != null) {
					out.flush();
					out.close();
				}
			} catch (IOException e) {
				log.error("IO stream close failed!", e);
			}
		}
	}

	/**
	 * Create file, including parent directory and file, if file is exists, will
	 * not crate a new file
	 * 
	 * @param file
	 * @throws IOException
	 */
	public static void createFile(File file) throws IOException {
		if (!file.exists()) {
			File path = new File(file.getParent());
			if (!path.exists()) {
				path.mkdirs();
			}
			file.createNewFile();
		}
	}

	/**
	 * delete file, if file is not a file kind, will not delete
	 * 
	 * @param filepath
	 *            all file path
	 */
	public static void removeFile(String filepath) {
		File file = new File(filepath);
		if (file.exists() && file.isFile()) {
			file.delete();
		}
		System.out.println("delete" + filepath);
	}
}
