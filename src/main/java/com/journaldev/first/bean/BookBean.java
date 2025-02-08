package com.journaldev.first.bean;

//https://www.geeksforgeeks.org/jsp-usebean-action-tag/
public class BookBean {
	private String title;
	private String author;
	private double price;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		if (title.length() > 30) {
			this.title = title.substring(0, 30) + "...";
		} else {
			this.title = title;
		}

	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		if (author.length() > 20) {
			this.author = author.substring(0, 20) + "...";
		} else {
			this.author = author;
		}
		
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
