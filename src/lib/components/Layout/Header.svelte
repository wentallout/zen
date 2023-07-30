<script>
	import List from '~icons/ph/list';
</script>

<header>
	<List width="32" height="32" />
	<a href="/">
		<div class="logo">Zen Garden</div>
	</a>
</header>

<style>
	header {
		width: 100%;
		display: flex;
		flex-direction: row;
		height: 80px;
		align-items: center;
		padding: 0 var(--space5);
		background-color: black;
		color: white;
		gap: var(--space4);
	}

	.logo {
		font-family: var(--fontFancy);
		font-size: var(--fontSizeHeading5);
	}
</style>
