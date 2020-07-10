package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Category;
import model.Product;
import model.User;
import service.CategoryService;
import service.ProductService;
import service.UserService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/product/add" })
public class ProductAddController extends HttpServlet {
	ProductService productService = new ProductServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories = categoryService.getAll();

		req.setAttribute("categories", categories);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/view/add-product.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Product product = new Product();
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);

		try {
			List<FileItem> items = servletFileUpload.parseRequest(req);
			for (FileItem item : items) {
				if (item.getFieldName().equals("name")) {
					product.setName(item.getString());
				} else if (item.getFieldName().equals("category")) {
					product.setCategory(categoryService.get(Integer.parseInt(item.getString())));
				} else if (item.getFieldName().equals("price")) {
					product.setPrice(Integer.parseInt(item.getString()));
				} else if (item.getFieldName().equals("des")) {
					product.setDes(item.getString());;
				} else if (item.getFieldName().equals("image")) {
					String root = getServletContext().getRealPath("/");
					File path = new File(root + "/uploads");
					if (!path.exists()) {
						boolean status = path.mkdirs();
					}
					String originalFileName = item.getName();
					int index = originalFileName.lastIndexOf(".");
					String ext = originalFileName.substring(index + 1);
					String fileName = System.currentTimeMillis() + "." + ext;
					File file = new File(path + "/" + fileName);
					item.write(file);
					product.setImage(fileName);
				}
			}

			productService.insert(product);

			resp.sendRedirect(req.getContextPath() + "/admin/product/list");
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
