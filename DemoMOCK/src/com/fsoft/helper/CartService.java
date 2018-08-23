package com.fsoft.helper;

import java.util.Collection;
import java.util.HashMap;

import javax.jws.WebService;

import com.fsoft.model.Fsoft;
import com.fsoft.model.Product;
import com.fsoft.service.ProductDAOImp;

public class CartService {
	private HashMap<Integer, CartItem> cartItems;

	public CartService() {
		super();
		cartItems = new HashMap<>();
	}

	public CartService(HashMap<Integer, CartItem> cartItems) {
		super();
		this.cartItems = cartItems;
	}

	public HashMap<Integer, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Integer, CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void addToCart(Integer id, CartItem item) {
		Boolean check = cartItems.containsKey(id);
		if (check) {
			int quantityOld = item.getQuantity();
			item.setQuantity(quantityOld+ 1);
            cartItems.put(id, item);
		} else {
			cartItems.put(id, item);
		}
	}
	public void removeItem(Integer id) {
		Boolean check = cartItems.containsKey(id);
		if (check) {
			cartItems.remove(id);
		}
	}

	public void updateItem(Integer id, int newQuantity,CartItem item) {
		Boolean check = cartItems.containsKey(id);
		if (check) {
			int quantityOld = item.getQuantity();
			item.setQuantity(newQuantity);
            cartItems.put(id, item);
		}
	}

	public Collection<CartItem> getItem() {
		return cartItems.values();
	}

	public int getCount() {
		return cartItems.size();
	}

	public double getAmount() {
		double amount = 0;
		for (CartItem item : getItem()) {
			amount += item.getAmount();
		}
		return amount;
	}
}
