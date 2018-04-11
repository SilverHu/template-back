package com.sys.repository;

import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

@NoRepositoryBean
public interface MyBaseRepository<T, ID> extends PagingAndSortingRepository<T, ID> {
	
}
