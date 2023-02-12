package model;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import bdUtil.MovieDAO;

public class Movie {
	//inform joan if you want to change this file***************************
	private int movie_id;
	private int user_id;
	private String name;
	private String description;
	private String director;
	private String casts;
	private String duration;
	private int price_id;
	private int genre_id;
	private String tags_id;
	private String story_by;
	private int year;
	private String poster;

	MovieDAO movDAO = new MovieDAO();

	Movie() {

	}

	public Movie(int movie_id, int user_id, String name, String description, String director, String casts, String duration,
			int price_id, int genre_id, String tags_id, String story_by, int year, String poster) {
		this.movie_id = movie_id;
		this.user_id = user_id;
		this.name = name;
		this.description = description;
		this.director = director;
		this.casts = casts;
		this.duration = duration;
//		this.price_id = price_id;
		this.genre_id = genre_id;
		this.tags_id = tags_id;
		this.story_by = story_by;
		this.year = year;
		this.poster = poster;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String[] getCasts() {
		return casts.split(",");
	}

	public String getCast() {
		return casts;
	}

	public void setCasts(String casts) {
		this.casts = casts;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

//	public int getPrice_id() {
//		return price_id;
//	}
//
//	public void setPrice_id(int price_id) {
//		this.price_id = price_id;
//	}

	public String getGenre() {
		return movDAO.getMovieGenre(genre_id);
	}

	public void setGenre_id(int genre_id) {
		this.genre_id = genre_id;
	}

	public List<String> getTags() {
		List<Integer> tagIds = Arrays.stream(tags_id.split(",")).map(Integer::parseInt).collect(Collectors.toList());
		return movDAO.getMovieTags(tagIds);
	}

	public void setTags_id(String tags_id) {
		this.tags_id = tags_id;
	}

	public String[] getStory_by() {
		return story_by.split(",");
	}

	public String getStoryBy() {
		return story_by;
	}

	public void setStory_by(String story_by) {
		this.story_by = story_by;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}
}