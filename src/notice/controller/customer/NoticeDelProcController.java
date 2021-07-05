package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDelProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDelProcController");
		
		//DB에서 삭제
		String seq=request.getParameter("c");
		
		Notice n = new Notice();
		NoticeDao dao = new NoticeDao();
		
		int af = dao.delete(seq);

		//목록으로 이동
		PrintWriter out = response.getWriter();
		if(af>0)
			response.sendRedirect("notice.jsp");
		else
			out.write("입력오류");
	
		
		
	}

}
