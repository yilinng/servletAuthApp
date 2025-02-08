package com.journaldev.first.entity;

import javax.persistence.*;

@Entity
@Table(name = "book")
public class Book {

	@Id
	@Column(name = "BOOK_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "title")
	private String title;

	@Column(name = "author")
	private String author;

	@Column(name = "price")
	private double price;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private User user;

	public Book() {

	}

	public Book(int id, String title, String author, double price, User user) {
		this.id = id;
		this.title = title;
		this.author = author;
		this.price = price;
		this.user = user;
	}

	public Book(String title, String author, double price, User user) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.user = user;
	}

	public User getUser() {
		return this.user;
	}

	public int getId() {
		return this.id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return this.title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getPrice() {
		return this.price;
	}

	// Getters and setters omitted for brevity
}
