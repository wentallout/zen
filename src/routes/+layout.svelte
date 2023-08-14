<script>
	import Footer from '$lib/components/Layout/Footer.svelte';
	import Header from '$lib/components/Layout/Header.svelte';
	import Sidebar from '$lib/components/Layout/Sidebar.svelte';

	import '$lib/styles/global.postcss';
</script>

<Header />
<div class="parent">
	<Sidebar />

	<main>
		<slot />
	</main>
</div>
<Footer />

<style>
	.parent {
		display: flex;
		flex-direction: row;
		z-index: 1;
		background-color: var(--colorBgLayout);
		overflow: hidden;
		/* gap: var(--space4); */
	}

	main {
		position: relative;
		z-index: 1;
		min-height: 100vh;
		width: 100%;
	}
</style>
