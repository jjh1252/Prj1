package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeRegProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeRegProcController");
		
		//DB에 저장
		String title = new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
		String content = new String(request.getParameter("content").getBytes("iso-8859-1"),"utf-8");

		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);

		NoticeDao dao = new NoticeDao();
		int af = dao.insert(n);

		//목록으로 이동
		PrintWriter out = response.getWriter();
		if(af>0)
			response.sendRedirect("notice.jsp");
		else
			out.write("입력오류");
	
		
		
	}

}
