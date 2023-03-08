package chap11;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener; // ������ web.xml�� ����� ���־�� ��

@WebListener
public class initialMember implements ServletContextListener {


    public void contextInitialized(ServletContextEvent sce)  { 	// ���ø����̼��� ���� �� �� �ڵ����� ����Ǵ� �޼��� WAS�� Ư�� �̺�Ʈ�� �߻����� �� ������
        ServletContext context = sce.getServletContext();	// ArrayList<Member>�� ���ø����̼� ����ҿ� ���� (���� �����Ͱ� �ȴ�)
        ArrayList<Member> members = new ArrayList<Member>();	//
        
        for(int i =0; i<8; i++) {
        	members.add(new Member("����ȣ"+ i, "park" + i + "@daum.net"));
        }
        
    	members.add(new Member("�迬��", null));
    	members.add(new Member("�迬��", null));
    	
    	context.setAttribute("members", members);
    	context.setAttribute("member", new Member());
    	
    	System.out.println("InitialMimber Strat!");	// �ܼ�â�� ��µ�
   }
	
    public void contextDestroyed(ServletContextEvent sce)  { 	// ���ø����̼��� ���� �� �� �ڵ����� ����Ǵ� �޼���
    	System.out.println("InitialMimber Destroy!");
   }
    
	
}
