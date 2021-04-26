package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import model.Cart;
import model.CartItem;
import model.OrderStatus;
import model.User;
import model.Invoice;
import model.Payment;
import service.CartItemService;
import service.CartService;
import service.CategoryService;
import service.UserService;
import service.InvoiceService;
import service.PaymentService;
import service.impl.CartServiceImpl;
import service.impl.CartServiceItemImpl;
import service.impl.CategoryServiceImpl;
import service.impl.UserServiceImpl;
import service.impl.InvoiceServiceImpl;
import service.impl.PaymentServiceImpl;
import tools.SendMail;
import util.RandomUUID;

import momo.allinone.models.CaptureMoMoResponse;
import momo.allinone.processor.allinone.CaptureMoMo;
import momo.shared.sharedmodels.Environment;
import momo.shared.utils.LogUtils;

@WebServlet(urlPatterns = "/member/invoice")
public class InvoiceController extends HttpServlet {
	InvoiceService invoiceService = new InvoiceServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session = req.getSession();
	Object obj = session.getAttribute("account");
	User u = (User) obj;
	List<Invoice> listInvoice = invoiceService.getByUser(u.getId());
	req.setAttribute("listInvoice", listInvoice);
	RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/view/invoice-list.jsp");
	dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
