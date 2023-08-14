<script>
	export let pageTitle = '';
	export let pageDesc = '';
</script>

<div class="title">
	<h1 class="title__text">{pageTitle}</h1>
	<p class="title__desc">{pageDesc}</p>
</div>

<style>
	.title {
		background-color: var(--colorBgSurface);
		max-width: 100%;
		color: var(--colorBgLayout);
		padding: var(--space5) var(--space5);
		position: relative;
		overflow: hidden;
		display: flex;
		gap: var(--space4);
		flex-direction: column;
		border-bottom: 1px solid var(--colorText);
	}

	.title__text {
		width: 100%;
		display: flex;
		font-family: var(--fontFancy);
	}

	
</style>
