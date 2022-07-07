<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>운동하실?</title>
<style>footer{background-color:#3c3935; text-align:center; font-size:15px; color: white; position:fixed; bottom:0; width:100%;}
.foo_div1{text-align:center; font-size:15px; color: white;}</style>
</head>
<body>
	<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("history.back()");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">운동하실?</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">모집</a></li>
				<li><a href="MAP.jsp">동네 체육시설 찾기</a></li>
			</ul>
			<% 
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<% 		
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%		
				}
			%>
			
		</div>
	</nav>
	<div class="container">
	<h1>모집게시판<br></h1>
			<p>모집게시판입니다. 같이 운동할 사람을 모집해보세요!<br><br></p>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분 " %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
				<div class="container">
	<div class="form-group">
		<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br><%= userID %></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
				
			</table>
		</form>
	</div>
</div>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">댓글</td>
				</tr>
				<tr>
				<%
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<Comment> list = commentDAO.getList( bbsID);
					for(int i=0; i<list.size(); i++){
				%>
					
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
											<td colspan="2"></td>
											<td align="right">
												<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
												%>
													
														<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>																	
												<%
												}
												%>	
											</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "C:\\Users\\오승택\\eclipse-workspace\\user\\src\\main\\webapp\\commentUpload";
												File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".png");
												if(commentFile.exists()){           //해당 댓글에 대응되는 사진이 있을 경우 사진도 보여준다.
											%>	
											<br><br><img src = "commentUpload/<%=bbsID%>사진<%=list.get(i).getCommentID() %>.png" border="300px" width="300px" height="300px"><br><br></td>
											<%} %>	
										</tr>
									</tbody>
								</table>			
							</div>
					
						<%
							}
						%>
				</tr>
		</table>
	</div>
</div>




			
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if (userID != null && userID.equals(bbs.getUserID())) {
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>		
		</div>
	</div>
	<footer>
	<div class="foo div"><span>㈜운동하실?</span>
	<span>주소: 22012 인천광역시 연수구 아카데미로 119(송도동) 인천대학교</span>
	<span>Tel:010-8903-9126</span></div>

	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>