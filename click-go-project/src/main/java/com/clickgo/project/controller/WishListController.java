package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.LikeStore;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.WishListService;

@Controller
@RequestMapping("/wish-list")
public class WishListController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private WishListService wishListService;

	@GetMapping({ "", "/" })
	public String wishList(@RequestParam(required = false) String kategory, Model model,
			@PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		List<String> categoryEntitys = new ArrayList<>();
		List<Category> categories = categoryService.findAll();
		categories.forEach(t -> {
			StringTokenizer firstTokenizer = new StringTokenizer(t.toString(), "=");
			String firstStr = firstTokenizer.nextToken();
			String secondStr = firstTokenizer.nextToken();
			StringTokenizer stringTokenizer = new StringTokenizer(secondStr, ")");
			String kate = stringTokenizer.nextToken();
			categoryEntitys.add(kate);
		});
		Page<LikeStore> likeStores = wishListService.findByCategory(principalDetails.getUser().getId(),
				kategory, pageable);

		model.addAttribute("categoryEntitys", categoryEntitys);
		model.addAttribute("likeStores", likeStores);
		return "user/my/wish-list/list";
	}
}