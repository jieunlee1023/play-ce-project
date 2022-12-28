package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.dto.res.CsBoard;
import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.service.BoardService;
import com.clickgo.project.service.StoreFranchiseService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private StoreFranchiseService franchiseService;

	@GetMapping({ "/board/board-list", "board/search" })
	public String board(@RequestParam(required = false) String q, Model model,
			@PageableDefault(size = 10, sort = "id", direction = Direction.DESC) Pageable pageable) {
		String searchTitle = q == null ? "" : q;

		Page<CsBoard> boards = boardService.getBoardList(pageable);

		int PAGENATION_BLOCK_COUNT = 10;

		int nowPage = boards.getPageable().getPageNumber() + 1;

		int startPageNumber = Math.max(nowPage + PAGENATION_BLOCK_COUNT, boards.getTotalPages());
		int endPageNumber = Math.min(nowPage - startPageNumber, 1);

		ArrayList<Integer> pageNumbers = new ArrayList<>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("boards", boards);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPageNumber", startPageNumber);
		model.addAttribute("endPageNumber", endPageNumber);
		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("q", searchTitle);
		franchiseMassageCount(model);
		return "board/board-list";
	}
	
	@GetMapping("/board/board-write-form")
	public String board(@RequestParam(required = false) String pageName, Model model) {
		model.addAttribute("nowPage", pageName);
		franchiseMassageCount(model);
		return "board/board-write-form";
	}

	@GetMapping("/board/{id}")
	public String showDetail(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.boardDetail(id));
		franchiseMassageCount(model);
		return "board/board-detail";
	}

	@GetMapping("/board/{id}/update-form")
	public String updateForm(@PathVariable(name = "id") int boardId, Model model) {
		model.addAttribute("board", boardService.boardDetail(boardId));
		franchiseMassageCount(model);
		return "board/board-update-form";
	}
	
	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}
}
