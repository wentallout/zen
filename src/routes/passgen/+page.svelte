<script>
	import PageTitle from '$lib/components/Layout/PageTitle.svelte';
	import PassGen from '$lib/components/PassGen/PassGen.svelte';
	import PassphraseGen from '$lib/components/PassGen/PassphraseGen.svelte';
</script>

<PageTitle pageTitle="Password Generator" pageDesc="Khoa's custom password generator." />

<PassGen />

<PassphraseGen />
