package com.future.my.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.board.vo.BoardVO;
import com.future.my.commons.SearchVO;

@Mapper
public interface IBoardDAO {
    public List<BoardVO> getBoardList();
    public List<BoardVO> searchBoardList(SearchVO search);
	public int writeBoard(BoardVO board);
}
