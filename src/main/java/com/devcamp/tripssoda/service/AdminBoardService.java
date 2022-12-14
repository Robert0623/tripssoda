package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.SearchCondition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminBoardService {

    int getCount() throws Exception;

    int remove(Integer id, Integer userId) throws Exception;

    int write(CombinedBoardDto combinedBoardDto) throws Exception;

    List<CombinedBoardDto> selectAllBoard() throws Exception;

    CombinedBoardDto read(Integer id) throws Exception;

    List<CombinedBoardDto> getPage(Map map) throws Exception;

    boolean modify(CombinedBoardDto combinedBoardDto) throws Exception;

    List<CombinedBoardDto> getSearchResultPage(SearchCondition sc, String menuCode) throws Exception;

    int getSearchResultCnt(SearchCondition sc, String menuCode) throws Exception;


    int selectAllInquiryCnt();

    List<InquiryDto> selectAllInquiry(SearchCondition sc);

    public List<CombinedBoardDto> getSearchResultPageForUser(SearchCondition sc, String menuCode) throws Exception;

    public int getSearchResultCntForUser(SearchCondition sc, String menuCode) throws Exception;
}
