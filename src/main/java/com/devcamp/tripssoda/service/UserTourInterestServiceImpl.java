package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTourInterestDto;
import com.devcamp.tripssoda.mapper.UserTourInterestMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserTourInterestServiceImpl implements UserTourInterestService {

    private UserTourInterestMapper userTourInterestMapper;

    public UserTourInterestServiceImpl(UserTourInterestMapper userTourInterestMapper) {
        this.userTourInterestMapper = userTourInterestMapper;
    }
    @Override
    public void insertUserTourInterest(Integer userId, String firstInterest, String secondInterest, String thirdInterest) throws Exception {

        UserTourInterestDto first = new UserTourInterestDto(userId, firstInterest, 1);
        UserTourInterestDto second = new UserTourInterestDto(userId, secondInterest, 2);
        UserTourInterestDto third = new UserTourInterestDto(userId, thirdInterest, 3);

        int rowCnt1 = userTourInterestMapper.insertUserTourInterest(first);
        if(rowCnt1 != 1) {
            throw new Exception("Insert firstUserTourInterest failed");
        }
        int rowCnt2 = userTourInterestMapper.insertUserTourInterest(second);
        if(rowCnt2 != 1) {
            throw new Exception("Insert secondUserTourInterest failed");
        }
        int rowCnt3 = userTourInterestMapper.insertUserTourInterest(third);
        if(rowCnt3 != 1) {
            throw new Exception("Insert thirdUserTourInterest failed");
        }
    }

    @Override
    public List<String> selectAllUserTourInterestKeyword(Integer userId) {
        return userTourInterestMapper.selectAllUserTourInterestKeyword(userId);
    }

    @Override
    public List<UserTourInterestDto> selectAllUserTourInterest(Integer userId) {
        return userTourInterestMapper.selectAllUserTourInterest(userId);
    }

    @Override
    public void updateUserTourInterest(String firstInterest, String secondInterest, String thirdInterest, HttpSession session) throws Exception {
        // ???????????? ???????????? ????????? ??????
        if(firstInterest.equals(secondInterest) || firstInterest.equals(thirdInterest) || secondInterest.equals(thirdInterest)) {
            throw new Exception("Interest are duplicated");
        }
        // ?????????????????? userId??? ?????????
        Integer userId = (Integer)session.getAttribute("id");
        // ?????? ????????? List??? ???????????? 1?????? 3?????? ?????????
        List<UserTourInterestDto> userTourInterestDtoList = userTourInterestMapper.selectAllUserTourInterest(userId);
        // ??????????????? ??? ????????? ?????? ???????????? ????????????, ?????? update???
        for(int i = 0; i < userTourInterestDtoList.size(); i++) {
            UserTourInterestDto userTourInterestDto = userTourInterestDtoList.get(i);
            if (i == 0) {
                userTourInterestDto.setTourIntrCode(firstInterest);
            } else if (i == 1) {
                userTourInterestDto.setTourIntrCode(secondInterest);
            } else if (i == 2) {
                userTourInterestDto.setTourIntrCode(thirdInterest);
            }
            userTourInterestMapper.updateUserTourInterest(userTourInterestDto);
        }
    }
}
