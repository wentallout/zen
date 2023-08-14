<script>
	export let data;

	export let cityName;

	$: console.log(data);
</script>

<div in:blur|local class="data__current">
	<img
		width="200"
		height="200"
		src="https://openweathermap.org/img/wn/{data.weather[0].icon}@4x.png"
		alt="weather icon" />
	<div class="data__detail">
		<div class="data__location">
			<h3>Today ({data.dt_txt.split(' ')[0]})</h3>
			<h2>{cityName} has {data.weather[0].description}</h2>
		</div>

		<div class="data__other">
			<p>Temperature: {(data.main.temp - 273.15).toFixed(2)} °C</p>
			<p>Wind: {data.wind.speed} M/S</p>
			<p>Humidity: {data.main.humidity}%</p>
		</div>
	</div>
</div>

<style>
	.data__current {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		align-items: center;
		background-color: var(--colorBgSurface);
		color: white;
		width: 100%;
		padding: var(--space5) var(--space6);
		border-radius: var(--borderRadiusSM);
		margin-bottom: var(--space7);
		gap: var(--space9);
	}

	.data__location {
		display: flex;
		flex-direction: column;
		gap: var(--space3);
		margin-bottom: var(--space6);
	}

	.data__detail {
		display: flex;
		flex-direction: column;
	}
	.data__other {
		display: flex;
		flex-direction: column;
	}
</style>
