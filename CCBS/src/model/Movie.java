package model;

public class Movie {
	private int movie_id;
	private int user_id;
	private String name;
	private String description;
	private String director;
	private String casts;
	private String duration;
	private int price_id;
	private String movie_type;
	private String tags_id;
	private String story_by;
	private int year;
	private String poster;

	Movie() {

	}

	public Movie(int movie_id, int user_id, String name, String description, String director, String casts, String duration,
			int price_id, String movie_type, String tags_id, String story_by, int year, String poster) {
		this.movie_id = movie_id;
		this.user_id = user_id;
		this.name = name;
		this.description = description;
		this.director = director;
		this.casts = casts;
		this.duration = duration;
		this.price_id = price_id;
		this.movie_type = movie_type;
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

	public void setCasts(String casts) {
		this.casts = casts;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getPrice_id() {
		return price_id;
	}

	public void setPrice_id(int price_id) {
		this.price_id = price_id;
	}

	public String getMovie_type() {
		return movie_type;
	}

	public void setMovie_type(String movie_type) {
		this.movie_type = movie_type;
	}

	public String[] getTags_id() {
		return tags_id.split(",");
	}

	public void setTags_id(String tags_id) {
		this.tags_id = tags_id;
	}

	public String[] getStory_by() {
		return story_by.split(",");
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
