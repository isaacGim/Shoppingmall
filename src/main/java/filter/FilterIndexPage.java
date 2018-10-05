package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.springframework.context.support.GenericXmlApplicationContext;

import item.bean.ItemDTO;
import item.dao.ItemDAO;

public class FilterIndexPage implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		GenericXmlApplicationContext context = new GenericXmlApplicationContext("spring/application-config.xml");
		ItemDAO itemDAO = (ItemDAO) context.getBean("itemDAO");
		List<ItemDTO> list = itemDAO.getItemList(); 
		request.setAttribute("list", list);
		chain.doFilter(request, response);
		context.close();
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
