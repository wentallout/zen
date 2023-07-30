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
		<div class="main__content">
			<slot />
		</div>
	</main>
</div>
<Footer />

<style>
	.parent {
		margin: 0 auto;
		display: flex;
		flex-direction: row;
		z-index: 1;
		background-color: var(--colorBgLayout);
	}

	main {
		position: relative;
		flex-grow: 1;
		z-index: 1;

		min-height: 100vh;
	}
</style>
