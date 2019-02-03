package com.utf18.site.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.utf18.site.service.ChatService;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService chatService;
	
		
	@ResponseBody
	@RequestMapping(value="getRoomList.do", method= { RequestMethod.GET, RequestMethod.POST })
	public List<ChatVO> getRoomList() throws Exception{
		List<ChatVO> RoomList = chatService.getRoomList();
		return RoomList;
	}
	
	//방만들기
	@RequestMapping(value="createChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String createChatRoom (Model model, HttpServletRequest req, ChatVO chat) throws Exception{
		
		logger.info("createChatRoom.do RUN! / Run Time: " + new Date());
		
		UserVO login = (UserVO)req.getSession().getAttribute("login");
		
		if(login==null) {
			return "redirect:/loginform.do";
		}
		
		logger.info(chat.toString());
		
		//해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )
		ChatVO VO = chatService.checkRoom(chat.getName());
		if(VO ==null) {
			chatService.createChatRoom(chat);
		}
		
		
		//생성한 방의 ChatMember 로 등록
		chatService.addRoomMember(new ChatMemberVO(0, login.getEmail(), chat.getName(), ""));
		
		
		//현재 방이름 넣기
		model.addAttribute("room", chat.getName());
		
		return "broadcast";
	}
	//중복확인
	@ResponseBody
	@RequestMapping(value="checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int checkRoom(Model model, String name) throws Exception{
		System.out.println("name="+name);
		
		ChatVO VO = chatService.checkRoom(name);
		//중복값이 없을경우
		if(VO ==null) {
			return 1;
		}
		else {
			return 0;
		}		
	}
	
	//방이동
	@RequestMapping(value="MoveChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String MoveChatRoom (Model model, HttpServletRequest req, String roomName) throws Exception{
		
		logger.info("MoveChatRoom.do RUN! / Run Time: " + new Date());
		
		UserVO login = (UserVO)req.getSession().getAttribute("login");
		
		if(login==null) {
			return "redirect:/loginform.do";
		}
		
		logger.info("이동할 방이름 : "+roomName);
		
		//이동하게 될 방 이름으로 수정
		chatService.updateRoomMember(new ChatMemberVO(0, login.getEmail(), roomName, ""));
		
		//접속 끊기 이전방은 수정하지 않음.
		
		//방이동 처리
		model.addAttribute("room", roomName);
		
		return "broadcast";
	}
	

	
	
}
