<%@page import="shop_member.dao.Shop_memberDAO"%>
<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	GenericXmlApplicationContext context = 
	new GenericXmlApplicationContext("spring/application-config.xml");
	
	Shop_memberDAO memberDAO = (Shop_memberDAO)context.getBean("shop_memberDAO");
	boolean valid = memberDAO.isExistId(id);
	context.close();
%>
<?xml version='1.0' encoding='UTF-8'?>
<id_check>
	<result><%=valid%></result>
</id_check>