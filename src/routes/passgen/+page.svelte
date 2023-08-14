<script>
	import PageTitle from '$lib/components/Layout/PageTitle.svelte';
	import PassGen from '$lib/components/PassGen/PassGen.svelte';
	import PassphraseGen from '$lib/components/PassGen/PassphraseGen.svelte';
</script>

<PageTitle pageTitle="Password Generator" pageDesc="Khoa's custom password generator." />

<div class="container">
	<PassGen />

	<PassphraseGen />
</div>

<style>
	.container {
		max-width: 480px;
	}
</style>
