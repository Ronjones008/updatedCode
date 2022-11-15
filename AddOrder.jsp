<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="AddOrder.jsp">
    
     Customer Id :
     <input type="number" name="customerId"/> <br/><br/>
     Stock Id :
     <input type="text" name="stockId"/ value="${param.id}"><br/><br/>
     OrderStatus :
     <select name="orderStatus">
                        <option value="ACCEPTED">ACCEPTED</option>
                        <option value="REJECTED">REJECTED</option>
                        <option value="DELAYED">DELAYED</option>
                        <option value="CANCELLED">CANCELLED</option>
                        <option value="OUT_OF_DELIVERY">OUT_OF_DELIVERY</option>
              </select> <br/><br/>
      Quantity Order :
      <input type="number" name="quantityOrder"/> <br/><br/>
      Ordered Date :
      <input type="date" name="orderedDate"/> <br/><br/>
      Price :
      <input type="number" name="price"/> <br/><br/>
      shipping_address1 :
      <input type="text" name="shippingAddress1"/> <br/><br/>
      shipping_address2 :
      <input type="text" name="shippingAddress2"/> <br/><br/>
      City :
      <input type="text" name="city"/> <br/><br/>
      Zipcode :
      <input type="text" name="zipcode"/> <br/><br/>
      Shipping :
      <input type="date" name="shippingDate"/> <br/><br/>
      Delivery :
      <input type="date" name="deliveryDate"/> <br/><br/>
      Expected Delivery :
      <input type="date" name="expecteddeliveryDate"/> <br/><br/>
      Gbill :
      <input type="number" name="gbill"/> <br/><br/>
      
      <input type="submit" value="Added Order" />
      </form>
       <c:if test="${param.customerId!= null}">
       <jsp:useBean id="order" class="com.Infinite.inventoryproject.Order" />
       <jsp:useBean id="dao" class="com.Infinite.inventoryproject.OrderDAO"/>
       <jsp:setProperty property="customerId" name="order"/>
       <jsp:setProperty property="stockId" name="order"/>
       <jsp:setProperty property="orderStatus" name="order"/>
       <jsp:setProperty property="quantityOrder" name="order"/>
       <jsp:setProperty property="price" name="order"/>
       <jsp:setProperty property="shippingAddress1" name="order"/>
       <jsp:setProperty property="shippingAddress2" name="order"/>
       <jsp:setProperty property="city" name="order"/>
       <jsp:setProperty property="zipcode" name="order"/>
       <jsp:setProperty property="gbill" name="order"/>
       
      <fmt:parseDate value="${param.orderedDate}" pattern="yyyy-mm-dd" var="OrderedDate" />
      <c:set var="sqlDate" value="${dao.convertDate(OrderedDate)}" />
      <c:out value="${sqlDate} }"/>
      <fmt:parseDate value="${param.deliveryDate}" pattern="yyyy-mm-dd" var="deliveryDate" />
      <c:set var="sqlDate1" value="${dao.convertDate(deliveryDate)}" />
      <c:out value="${sqlDate1}"/>
      
      <fmt:parseDate value="${param.shippingDate}" pattern="yyyy-mm-dd" var="shippingDate" />
      <c:set var="sqlDate2" value="${dao.convertDate(shippingDate)}" />
      <c:out value="${sqlDate2}"/>
       
      <fmt:parseDate value="${param.expecteddeliveryDate}" pattern="yyyy-mm-dd" var="expecteddeliveryDate" />
      <c:set var="sqlDate3" value="${dao.convertDate(expecteddeliveryDate)}" />
      <c:out value="${sqlDate3}"/>
       
       <jsp:setProperty property="orderedDate" name="order" value="${sqlDate}"/>
       <jsp:setProperty property="shippingDate" name="order" value="${sqlDate1}" />
       <jsp:setProperty property="deliveryDate" name="order" value="${sqlDate2}" />
       <jsp:setProperty property="expecteddeliveryDate" name="order" value="${sqlDate3}"/>
      
      <c:out value="${dao.addOrder(order)}" />
      </c:if>

</body>
</html>