package org.edu.intertwine.post.controller;

public class FeedRequest {
	private int startIndex;
	private int count;
	private int loadCount;

	// Getters and setters for each property
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLoadCount() {
		return loadCount;
	}

	public void setLoadCount(int loadCount) {
		this.loadCount = loadCount;
	}
}
