<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">

<style>
body.background {
	background-color: black;
	font-family: 'Poppins', sans-serif;
}

.page-wrapper {
	margin: 80px 300px;
	color: white;
}

.title {
	color: yellow;
}
</style>

<script>
	function updateTowns(state) {
		var towns = {
			"Johor" : ["Ayer Baloi","Ayer Hitam","Ayer Tawar 2","Bandar Penawar","Bandar Tenggara","Batu Anam","Batu Pahat","Bekok","Benut","Bukit Gambir","Bukit Pasir","Chaah","Endau","Gelang Patah","Gerisek","Gugusan Taib Andak","Jementah","Johor Bahru","Kahang","Kluang","Kota Tinggi","Kukup","Kulai","Labis","Layang-Layang","Masai","Mersing","Mersing","Muar","Nusajaya","Pagoh","Paloh","Panchor","Parit Jawa","Parit Raja","Parit Sulong","Pasir Gudang","Pekan Nenas","Pengerang","Pontian","Pulau Satu","Rengam","Rengit","Segamat","Semerah","Senai","Senggarang","Seri Gading","Seri Medan","Simpang Rengam","Sungai Mati","Tangkak","Ulu Tiram","Yong Peng"],
			"Kedah" : ["Anak Bukit","Bandar Darulaman","Bedong","Bukit Kayu Hitam","Bukit Selambau","Changlun","Durian Burung","Guar Chempedak","Jeniang","Kangkong","Kepala Batas","Kodiang","Kota Kuala Muda","Kota Sarang Semut","Kuala Ketil","Kuala Pegang","Kupang","Lunas","Megat Dewa","Padang Serai","Simpang Empat","Sintok","Sungai Lalang","Sungai Limau","Sungai Petani","Tanjung Dawai","Tokai"],
			"Kelantan" : ["Ayer Lanas","Bachok","Cherang Ruku","Dabong","Gua Musang","Jeli","Kem Desa Pahlawan","Ketereh","Kota Bharu","Kuala Balah","Kuala Krai","Machang","Melor","Pasir Mas","Pasir Puteh","Pulai Chondong","Rantau Panjang","Selising","Tanah Merah","Temangan","Tumpat","Wakaf Bharu"],
			"Malacca" : ["Alor Gajah","Asahan","Ayer Keroh","Bemban","Durian Tunggal","Jasin","Kem Trendak","Kuala Sungai Baru","Lubok China","Masjid Tanah","Melaka","Melaka","Merlimau","Selandar","Sungai Rambai","Sungai Udang","Tanjong Kling"],
			"Negeri Sembilan" : ["Bahau","Bandar Enstek","Bandar Seri Jempol","Batu Kikir","Gemas","Gemencheh","Johol","Kota","Kuala Klawang","Kuala Pilah","Labu","Linggi","Mantin","Niai","Nilai","Nilai","Port Dickson","Pusat Bandar Palong","Rantau","Rembau","Rompin","Seremban","Seremban","Si Rusa","Simpang Durian","Simpang Pertang","Tampin","Tanjong Ipoh"],
			"Pahang" : ["Balok","Bandar Bera","Bandar Pusat Jengka","Bandar Pusat Jengka","Bandar Tun Abdul Razak","Benta","Bentong","Brinchang","Bukit Fraser","Bukit Goh","Bukit Kuin","Chenor","Chini","Damak","Dong","Gambang","Genting Highlands","Jerantut","Karak","Kemayan","Kuala Krau","Kuala Lipis","Kuala Rompin","Kuantan","Kuantan","Lanchang","Lurah Bilut","Maran","Mentakab","Muadzam Shah","Padang Tengku","Pekan","Raub","Ringlet","Sega","Sungai Koyan","Sungai Lembing","Tanah Rata","Temerloh","Temerloh","Triang"],
			"Penang" : ["Ayer Itam","Balik Pulau","Batu Ferringhi","Batu Maung","Bayan Lepas","Bukit Mertajam","Butterworth","Gelugor","Jelutong","Kepala Batas","Kubang Semang","Nibong Tebal","Penaga","Penang Hill","Perai","Permatang Pauh","Pulau Pinang","Simpang Ampat","Sungai Jawi","Tanjong Bungah","Tanjung Bungah","Tasek Gelugor","Tasek Gelugur","USM Pulau Pinang"],
			"Perak" : ["Ayer Tawar","Bagan Datoh","Bagan Serai","Bandar Seri Iskandar","Batu Gajah","Batu Kurau","Behrang Stesen","Bidor","Bota","Bruas","Changkat Jering","Changkat Keruing","Chemor","Chenderiang","Chenderong Balai","Chikus","Enggor","Gerik","Gopeng","Hutan Melintang","Intan","Ipoh","Jeram","Kampar","Kampung Gajah","Kampung Kepayang","Kamunting","Kuala Kangsar","Kuala Kurau","Kuala Sepetang","Lambor Kanan","Langkap","Lenggong","Lumut","Malim Nawar","Manong","Matang","Padang Rengas","Pangkor","Pantai Remis","Parit","Parit Buntar","Pengkalan Hulu","Pusing","Rantau Panjang","Sauk","Selama","Selekoh","Seri Manjong","Seri Manjung","Simpang","Simpang Ampat Semanggol","Sitiawan","Slim River","Sungai Siput","Sungai Sumun","Sungkai","Taiping","Tanjong Malim","Tanjong Piandang","Tanjong Rambutan","Tanjong Tualang","Tapah","Tapah Road","Teluk Intan","Temoh","TLDM Lumut","Trolak","Trong","Tronoh","Ulu Bernam","Ulu Kinta"],
			"Perlis" : ["Arau","Kaki Bukit","Kangar","Kuala Perlis","Padang Besar","Simpang Ampat"],
			"Selangor" : ["Ampang Jaya","Assam Jawa","Bandar Baru Selayang","Bandar Kundang","Bangi, Selangor","Banting","Batang Kali","Batu Caves","Beranang","Bestari Jaya","Broga","Bukit Rotan","Cyberjaya","Gombak","Jenjarom","Kajang","Kampung Kuantan","Kapar","Kuala Kubu Bharu","Kuala Selangor","Kuala Sungai Buloh","Kuang","Lagong","Meru","Mutiara Damansara","Padang Jawa","Pandamaran","Paya Jaras","Port Klang","Puchong","Rawang, Selangor","Sabak, Selangor","Salak Tinggi","Sekinchan","Selayang","Semenyih","Sepang (town)","Seri Kembangan","Sungai Ayer Tawar","Sungai Besar","Sungai Buaya","Sungai Burong","Sungai Choh","Sungai Pelek","Sungai Pelong","Sungai Tengi","Taman Melawati","Taman Tasik Semenyih","Tanjung Sepat, Selangor","Teluk Datok","Ulu Yam"],
			"Terengganu" : ["Ajil","Al Muktatfi Billah Shah","Ayer Puteh","Bukit Besi","Bukit Payong","Ceneh","Chalok","Cukai","Dungun","Jerteh","Kampung Raja","Kemasek","Kerteh","Ketengah Jaya","Kijal","Kuala Berang","Kuala Besut","Kuala Terengganu","Marang","Paka","Permaisuri","Sungai Tong"],
			"Labuan" : ["Labuan"],
			"Putrajaya"	: ["Putrajaya"],
			"Kuala Lumpur" : ["Kepong","Batu","Wangsa Maju","Segambut","Setiawangsa","Titiwangsa","Bukit Bintang","Lembah Pantai","Seputeh","Cheras","Bandar Tun Razak"],
			"Sabah": ["Beaufort","Beluran","Beverly","Bongawan","Inanam","Keningau","Kota Belud","Kota Kinabalu","Kota Kinabatangan","Kota Marudu","Kuala Penyu","Kudat","Kunak","Lahad Datu","Likas","Membakut","Menumbok","Nabawan","Pamol","Papar","Penampang","Putatan","Ranau","Sandakan","Semporna","Sipitang","Tambunan","Tamparuli","Tanjung Aru","Tawau","Tenghilan","Tenom","Tuaran"],
			"Sarawak": ["Asajaya","Balingian","Baram","Bau","Bekenu","Belaga","Belaga","Belawai","Betong","Bintangor","Bintulu","Dalat","Daro","Debak","Engkilili","Julau","Kabong","Kanowit","Kapit","Kota Samarahan","Kuching","Lawas","Limbang","Lingga","Long Lama","Lubok Antu","Lundu","Lutong","Matu","Miri","Mukah","Nanga Medamit","Niah","Pusa","Roban","Saratok","Sarikei","Sebauh","Sebuyau","Serian","Sibu","Siburan","Simunjan","Song","Spaoh","Sri Aman","Sundar","Tatau"],
		};

		var townSelect = document.getElementById("town");
		townSelect.innerHTML = "";
		for (var i = 0; i < towns[state].length; i++) {
			var townOption = document.createElement("option");
			townOption.value = towns[state][i];
			townOption.text = towns[state][i];
			townSelect.appendChild(townOption);
		}
	}
</script>


</head>
<body class="background">
	<div class="page-wrapper">
		<div class="container">
			<h1 class="title mb-4">Register account</h1>
			<form action="register_submit" method="post" enctype="multipart/form-data">
				<div class="row mb-4">
					<div class="col">
						Name <input type="text" name="name" class="form-control" placeholder="Your name" required />
					</div>
				</div>
				<div class="row mb-4">
					<div class="col">
						Date of Birth <input type="date" name="dob" class="form-control" required />
					</div>
					<div class="col">
						Phone no <input type="text" name="phoneNo" class="form-control" placeholder="0123456789" required />
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						Address <input type="text" name="address" class="form-control"
							placeholder="Address Line" required />
					</div>
				</div>
				
				<div class="row mb-4">
					<%
						String state[] = { "Johor", "Kedah", "Kelantan", "Malacca", "Negeri Sembilan", "Pahang", "Penang", "Perak",
								"Perlis", "Sabah", "Sarawak", "Selangor", "Terengganu", "Kuala Lumpur", "Labuan", "Putrajaya" };

						pageContext.setAttribute("state", state);
					%>
					<div class="col">
						State <select id="state" name="stateSelect" class="form-select" onchange="updateTowns(this.value)">
							<option selected value="">Select a state</option>
							<c:forEach items="${pageScope.state}" var="state"
								varStatus="loop">
								<option value="<c:out value='${state}'/>"><c:out
										value="${state}" /></option>
							</c:forEach>
						</select>
					</div>

					<div class="col">
						Town <select name="townSelect" class="form-select" id="town">
							<option selected value="">Select a town</option>
						</select>

					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						Username <input type="text" name="userName" class="form-control" placeholder="example123"
							required />
					</div>
				</div>

				<div class="row mb-4">
					<div class="col">
						Password <input type="password" name="password" placeholder="******"
							class="form-control" required />
					</div>
				</div>
				
				<div class="row mb-4">
					<div class="col">
						Security question
						<select name="securityQuestion" class="form-select" required>
							<option value="hobby">What is your hobby?</option>
							<option value="favFood">What is your favourite food?</option>
							<option value="school">What is your primary school?</option>
						</select>
					</div>
					<div class="col">
						Answer
						<input type="text" class="form-control" name="securityAns" placeholder="example" required/>
					</div>
				</div>
				
				<div class="row">
					<div class="col">Photo upload (.jpg/.jpeg/.png)</div>
				</div>

				<div class="row">
					<div class="col">
						<input type="file" name="photoFile" class="photoFile mb-5" />
					</div>
				</div>

				<div class="row mb-4">
					<div class="col">
						<input class="form-check-input" type="checkbox" name="tncCheckbox"
							required> I acknowledge that I have read and understand the Terms and Conditions
					</div>
				</div>

				<input type="submit" class="btn btn-success" value="Register"/>
			</form>
		</div>
	</div>
</body>
</html>