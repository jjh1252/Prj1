package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController");
		String seq = request.getParameter("c");//notice.jsp에 있는c를  seq로 받는다
		String hit = request.getParameter("h");//notice.jsp에 있는h를  hit로 받는다
		//조회수신호들어오는지 확인
		System.out.println("hit : " + hit);
		//NoticeDao 객체생성
		NoticeDao dao = new NoticeDao();
		//Notice getNotice에서 작업한 값을 가져온다.
		Notice n = dao.getNotice(seq,hit);//seq, hit를 dao에있는 getNotice로 보내준다
		
		//request에 n을 저장 즉 jsp단에서 n을 이용해서 vo패키지에있는
		//getTitle 를 호출해서 $(n.title)이렇게 사용할 수 있다.
		request.setAttribute("n", n);
		//jsp로 forward
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);

	}

}
