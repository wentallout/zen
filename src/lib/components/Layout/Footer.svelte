<script>
	import SocialList from './SocialList.svelte';
	import FooterBg from '$lib/assets/images/footer-bg.jpg';
</script>

<footer>
	<div class="footer__content">
		<div class="footer__col">
			<h5 class="footer__title">About</h5>
			<ul class="footer__list">
				<li class="footer__item">
					<p>Zen Garden is a project to bring all productivity tools into one unified location.</p>
				</li>
				<li class="footer__item">
					<SocialList />
				</li>
			</ul>
		</div>
		<div class="footer__col">
			<h5 class="footer__title">Navigate</h5>

			<ul class="footer__list">
				<li>
					<a href="">
						<p>HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="footer__col">
			<h5 class="footer__title">Navigate</h5>

			<ul class="footer__list">
				<li>
					<a href="">
						<p>HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>
			</ul>
		</div>
		<div class="footer__col">
			<h5 class="footer__title">Navigate</h5>

			<ul class="footer__list">
				<li>
					<a href="">
						<p>HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>

				<li>
					<a href="">
						<p class="footer__item">HeroShit</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer__overlay" />
	<img class="footer__bg" alt="footer__bg" src={FooterBg} />
</footer>

<style>
	footer {
		padding: 140px 24px;
		color: var(--colorBgLayout);
		position: relative;
		overflow: hidden;
	}

	.footer__bg {
		position: absolute;
		inset: 0;
		z-index: -2;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

	.footer__overlay {
		content: '';
		width: 100%;
		height: 100%;
		/* background: linear-gradient(to top, #3204fdba, #9907facc); */
		position: absolute;
		inset: 0;
		z-index: -1;
	}

	.footer__content {
		width: 100%;
		background-color: var(--colorBgSurfaceGlassy);
		margin: auto;
		z-index: 1;
		height: fit-content;
		border-radius: var(--borderRadius);
		padding: var(--space8) var(--space6);

		--min: 20ch;
		--gap: var(--space8);

		display: grid;
		grid-gap: var(--gap);
		grid-template-columns: repeat(auto-fit, minmax(min(100%, var(--min)), 1fr));
		backdrop-filter: blur(5px);
	}

	.footer__title {
		font-weight: 500;
		margin-bottom: var(--space6);
	}

	.footer__list {
		display: flex;
		flex-direction: column;
		gap: var(--space4);
		max-width: var(--proseWidth);
	}
</style>
