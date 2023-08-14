<script>
	import CurrentWeatherCard from './../../lib/components/Weather/CurrentWeatherCard.svelte';
	import MiniWeatherCard from '$lib/components/Weather/MiniWeatherCard.svelte';
	import PageTitle from '$lib/components/Layout/PageTitle.svelte';
	import { onMount } from 'svelte';
	import { blur } from 'svelte/transition';
	import Spinner from '$lib/components/Loading/Spinner.svelte';
	let cityInput;
	let fiveDaysForecast;
	let currentWeather;
	let newCityName;

	$: fiveDaysForecast;
	$: newCityName;

	const API_KEY = `0ce29e6314149fac7ccf88c8489a268b`;

	function handleSearchInput() {
		getCityCoordinates();
	}

	const getWeatherDetails = (cityName, lat, lon) => {
		newCityName = cityName;
		const WEATHER_API_URL = `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}`;

		fetch(WEATHER_API_URL)
			.then((res) => res.json())
			.then((data) => {
				let uniqueForecastDays = [];

				fiveDaysForecast = data.list.filter((forecast) => {
					const forecastDate = new Date(forecast.dt_txt).getDate();
					if (!uniqueForecastDays.includes(forecastDate)) {
						uniqueForecastDays = [...uniqueForecastDays, forecastDate];
						return uniqueForecastDays;
					}
				});

				// currentWeather.cityName = cityName;
				currentWeather = fiveDaysForecast[0];
			})
			.catch(() => {
				alert('error occurred while fetching the weather forecast');
			});
	};

	const getCityCoordinates = () => {
		let cityName = cityInput.trim();

		if (!cityName) return;

		const GEOCODING_API_URL = `https://api.openweathermap.org/geo/1.0/direct?q=${cityName}&limit=1&appid=${API_KEY}`;

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

	const getUserCoordinates = () => {
		navigator.geolocation.getCurrentPosition(
			(position) => {
				const { latitude, longitude } = position.coords;

				const REVERSE_GEOCODING_URL = `https://api.openweathermap.org/geo/1.0/reverse?lat=${latitude}&lon=${longitude}&limit=1&appid=${API_KEY}`;

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
		<div class="input-group">
			<label for="cityname">City name</label>
			<input
				id="cityname"
				on:keyup={(e) => e.key === 'Enter' && handleSearchInput()}
				bind:value={cityInput}
				class="weather__input"
				type="text"
				placeholder="Ex: New York, London" />
		</div>

		<div class="button-group">
			<button disabled={!cityInput} on:click={handleSearchInput} class="btn btn--primary textBody">
				Search</button>
			<button on:click={handleWeatherCurrentLocation} class="btn btn--secondary textBody">
				Use current location
			</button>
		</div>

		<div class="data">
			{#if currentWeather}
				{#key currentWeather}
					<CurrentWeatherCard cityName={newCityName} data={currentWeather} />
				{/key}
			{/if}

			<div class="forecast">
				<div class="forecast__cards">
					{#each fiveDaysForecast || [] as forecast}
						{#key forecast}
							<MiniWeatherCard data={forecast} />
						{/key}
					{/each}
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.forecast__cards {
		display: flex;
		flex-direction: row;
		gap: var(--space5);
		flex-wrap: wrap;
	}
</style>
