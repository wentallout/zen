<script>
	// import FooterBg from '$lib/assets/images/footer-bg.jpg';
</script>

<div class="welcome">
	<h1 class="display welcome__text">Welcome to Zen Garden</h1>
	<img class="welcome__bg" src="aya" alt="" srcset="" />
</div>

<style>
	.welcome__text {
		text-align: center;
		z-index: 2;
	}

	.welcome__bg {
		position: absolute;
		inset: 0;
		z-index: -1;
		object-fit: contain;
	}

	.welcome {
		position: relative;
		width: 100%;
		height: 400px;
		overflow: hidden;
	}
</style>
