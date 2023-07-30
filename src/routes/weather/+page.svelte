<script>
	import MiniWeatherCard from '$lib/components/Weather/MiniWeatherCard.svelte';
	import PageTitle from '$lib/components/Layout/PageTitle.svelte';
	import { onMount } from 'svelte';
	import { fade } from 'svelte/transition';
	let cityInput;
	let fiveDaysForecast;
	let currentWeather;
	let newCityName;

	$: fiveDaysForecast;
	$: newCityName;

	const API_KEY = `0ce29e6314149fac7ccf88c8489a268b`;

	function handleSearch() {
		getCityCoordinates();
	}

	const getCityCoordinates = () => {
		let cityName = cityInput.trim();

		if (!cityName) return;

		const GEOCODING_API_URL = `http://api.openweathermap.org/geo/1.0/direct?q=${cityName}&limit=1&appid=${API_KEY}`;

		fetch(GEOCODING_API_URL)
			.then((res) => res.json())
			.then((data) => {
				if (!data.length) return alert(`No coordinates found for ${cityName}`);

				const { name, lat, lon } = data[0];

				getWeatherDetails(name, lat, lon);
			})
			.catch(() => {
				alert('Error occured');
			});
	};

	const getWeatherDetails = (cityName, lat, lon) => {
		newCityName = cityName;
		const WEATHER_API_URL = `http://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}`;

		fetch(WEATHER_API_URL)
			.then((res) => res.json())
			.then((data) => {
				const uniqueForecastDays = [];

				fiveDaysForecast = data.list.filter((forecast) => {
					const forecastDate = new Date(forecast.dt_txt).getDate();
					if (!uniqueForecastDays.includes(forecastDate)) {
						return uniqueForecastDays.push(forecastDate);
					}
				});

				currentWeather = fiveDaysForecast[0];
			})
			.catch(() => {
				alert('error occurred while fetching the weather forecast');
			});
	};

	const getUserCoordinates = () => {
		navigator.geolocation.getCurrentPosition(
			(position) => {
				const { latitude, longitude } = position.coords;

				const REVERSE_GEOCODING_URL = `http://api.openweathermap.org/geo/1.0/reverse?lat=${latitude}&lon=${longitude}&limit=1&appid=${API_KEY}`;

				fetch(REVERSE_GEOCODING_URL)
					.then((res) => res.json())
					.then((data) => {
						const { name } = data[0];
						getWeatherDetails(name, latitude, longitude);
					})
					.catch(() => {
						alert('error occurred while fetching the weather forecast');
					});
			},
			(error) => {
				if (error.code === error.PERMISSION_DENIED) {
					alert('Geolocation request denied');
				}
			}
		);
	};

	function handleWeatherCurrentLocation() {
		getUserCoordinates();
	}

	onMount(() => {
		handleWeatherCurrentLocation();
	});
</script>

<PageTitle pageTitle="Weather" pageDesc="Wanna know if tomorrow's weather is great for dating?" />

<div class="container">
	<div class="weather">
		<p>Enter a city name</p>
		<input
			on:keyup={(e) => e.key === 'Enter' && handleSearch()}
			bind:value={cityInput}
			class="weather__input"
			type="text"
			placeholder="Ex: New York, London"
		/>

		<button on:click={handleSearch} class="btn btn--primary"> <p>Search</p></button>
		<button on:click={handleWeatherCurrentLocation} class="btn btn--secondary">
			<p>Use current location</p>
		</button>

		<div class="data">
			{#if currentWeather}
				<div transition:fade|global class="data__current">
					<div class="data__detail">
						<h2>{newCityName}</h2>
						<h3>{currentWeather.dt_txt.split(' ')[0]}</h3>
						<p>Temperature: {(currentWeather.main.temp - 273.15).toFixed(2)} °C</p>
						<p>Wind: {currentWeather.wind.speed} M/S</p>
						<p>Humidity: {currentWeather.main.humidity}%</p>
					</div>
					<div class="data__icon">
						<img
							class="weather__icon"
							src="https://openweathermap.org/img/wn/{currentWeather.weather[0].icon}@4x.png"
							alt="weather icon"
						/>
						<p>{currentWeather.weather[0].description}</p>
					</div>
				</div>
			{/if}

			<div class="forecast">
				<div class="forecast__cards">
					{#each fiveDaysForecast || [] as forecast}
						<MiniWeatherCard data={forecast} />
					{/each}
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.weather {
	}

	.weather__input {
		height: 48px;
		border-radius: var(--borderRadiusSM);
		outline: 0;
		border: 1px solid var(--colorText);
		padding: 0 var(--space2);
		margin-bottom: var(--space6);
	}

	.weather__icon {
		aspect-ratio: 1/1;
	}

	.data__current {
		display: flex;
		flex-direction: row;
		align-items: center;
		background-color: black;
		color: white;
		width: fit-content;
		padding: var(--space4) var(--space6);
		border-radius: var(--borderRadiusSM);
		margin-bottom: var(--space7);
		justify-content: space-between;
		gap: var(--space5);
	}

	.forecast__cards {
		display: flex;
		flex-direction: row;
		gap: var(--space4);
		flex-wrap: wrap;
	}
</style>
