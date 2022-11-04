package com.ssafy.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.board.model.BoardDto;
import com.ssafy.board.model.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;


@RestController
@RequestMapping("/board")
@CrossOrigin("*")
@Api("어드민 컨트롤러  API V1")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@ApiOperation(value = "게시판목록", notes = "게시판의 <big>전체 목록</big>을 반환해 줍니다.")
	@ApiResponses({ 
		@ApiResponse(code = 200, message = "게시판목록 OK!!"), 
		@ApiResponse(code = 404, message = "페이지없어!!"),
		@ApiResponse(code = 500, message = "서버에러!!") })
	@GetMapping(value = "/list")
	public ResponseEntity<?> boardlist() {
		logger.debug("ABoardController call");
		try {
			List<BoardDto> list = boardService.list();
			if(list != null && !list.isEmpty()) {
				return new ResponseEntity<List<BoardDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	@ApiOperation(value = "게시판", notes = "게시판의 <big>한개의</big>을 반환해 줍니다.")
	@ApiResponses({ @ApiResponse(code = 200, message = "게시판글 OK!!"), @ApiResponse(code = 404, message = "페이지없어!!"),
			@ApiResponse(code = 500, message = "서버에러!!") })
	@GetMapping(value = "/list/{articleNo}")
	public ResponseEntity<?> boardetail(@PathVariable int articleNo) {
		logger.debug("ABoardController boardetail");
		try {
			BoardDto dto= boardService.getBoard(articleNo);
			if(dto != null ) {
				return new ResponseEntity<BoardDto>(dto, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	@ApiOperation(value = "게시판", notes = "게시판의 <big>한개의</big>를 작성한다.")
	@ApiResponses({ @ApiResponse(code = 200, message = "게시판글 OK!!"), @ApiResponse(code = 404, message = "페이지없어!!"),
			@ApiResponse(code = 500, message = "서버에러!!") })
	@PostMapping(value = "/write")
	public ResponseEntity<?> write(@RequestBody BoardDto board) {
		logger.debug("ABoardController aboard/write {}",board);
		try {
			boardService.write(board);
			List<BoardDto> list = boardService.list();
			if(list != null && !list.isEmpty()) {
				return new ResponseEntity<List<BoardDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
