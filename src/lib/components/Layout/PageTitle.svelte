<script>
	export let pageTitle = '';
	export let pageDesc = '';
</script>

<div class="title">
	<h1 class="title__text display">{pageTitle}</h1>
	<p class="title__desc">{pageDesc}</p>
</div>

<style>
	.title {
		width: 100%;
		background-color: var(--colorBgSurface);
		color: var(--colorBgLayout);
		margin-bottom: var(--space7);
		padding: var(--space5) var(--space4);
		position: relative;
		overflow: hidden;
		display: flex;
		gap: var(--space4);
		flex-direction: column;

		border-bottom: 1px solid var(--colorText);
	}
</style>
