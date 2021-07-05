package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditController");
		String seq = request.getParameter("c");
		//NoticeDao 객체생성
		NoticeDao dao = new NoticeDao();
		//Notice getNotice에서 작업한 값을 가져온다.
		Notice n = dao.getNotice(seq);
		
		//request에 n을 저장
      request.setAttribute("n", n);
      //jsp로 forward
      request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);

		
	}

	
	/*public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditController");
		String seq = request.getParameter("c");
		//NoticeDao 객체생성
		NoticeDao dao = new NoticeDao();
		//Notice getNotice에서 작업한 값을 가져온다.
		Notice n = dao.getNotice(seq);
		
		//request에 n을 저장
      request.setAttribute("n", n);
      //jsp로 forward
      request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);

	}
	*/
}
