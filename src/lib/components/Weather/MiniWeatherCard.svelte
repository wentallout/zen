<script>
	import { blur } from 'svelte/transition';

	export let data;

	function formatDate(inputDate) {
		const dateParts = inputDate.split(' ');
		const [year, month, day] = dateParts[0].split('-');

		const formattedDate = new Intl.DateTimeFormat('en', {
			day: 'numeric',
			month: 'short',
			year: 'numeric'
		}).format(new Date(inputDate));
		return formattedDate;
	}

	let formattedDate = formatDate(data.dt_txt);
</script>

<div in:blur={{ duration: 200 }} class="forecast__card">
	<h4>{formattedDate}</h4>
	<img
		width="100"
		height="100"
		class="weather__icon"
		src="https://openweathermap.org/img/wn/{data.weather[0].icon}@2x.png"
		alt="weather icon" />
	<p>{(data.main.temp - 273.15).toFixed(2)} C</p>
	<p>Wind: {data.wind.speed} M/S</p>
	<p>Humidity: {data.main.humidity}%</p>
</div>

<style>
	.forecast__card {
		background-color: var(--colorBgSurface);
		color: var(--colorBgLayout);
		padding: var(--space4) var(--space6);
		border-radius: var(--borderRadiusSM);
		aspect-ratio: 1/1;
	}
</style>
