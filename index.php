<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="You app for smart urban transport">
		<meta name="keywords" content="Transport, ride, urban, car, share">
		<meta name="author" content="Hege Refsnes">
		<link rel="stylesheet" type="text/css" href="index.css">
		<link rel="stylesheet" type="text/css" href="css/divbox.css" media="screen" />
		<script src="http://cdn.jquerytools.org/1.2.6/full/jquery.tools.min.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script> 
		<script type="text/javascript" src="js/divbox.js"></script>
	</head>
	<body>
		<div id="page-wrap">
			<div id="header">
			<div id="title">
			<h1>Carona Board</h1>
			<h2>Seu carro não precisa levar apenas você</h2>
			<ol>
				<li>Encontre uma rota que passe perto do seu destino</li>
				<li>Clique no botão "Quero Carona"</li>
				<li>Preencha o pedido de carona e envie o pedido</li>
				<li><strong>Pronto!</strong> Seu colega oferecendo carona para a rota selecionada irá receber sua mensagem</li>
			</ol>
			</div>
			<div id="dar_carona">
			<h4>AVISO: PRECISAMOS DE DOADORES DE CARONA PARA ZONA NORTE!</h4>
			<h3>Voce quer dar carona? </h3> <a class="cadastro" href="http://goo.gl/forms/ohEbgkMa9i" target="_blank">Se cadastre aqui</a>
			</div>
			</div>
			<table>
					<thead>
						<tr>
							<th>Rota</th>
							<th>Trajeto</th>
							<th>Quando</th>
							<th>Horário</th>
							<th>Motorista</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><strong>Aeroporto</strong></td>
				            <td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Estação Trensurb Bairro Anchieta</li>
				            	</ol>
				            	<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>19:00</td>
							<td>Jordana Seelig</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/TQAKwXzAg3" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Auxiliadora</strong></td>
				            <td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Carlos Gomas, 24 de Outubro</li>
				            	</ol>
				            	<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>18:00 - 19:00</td>
							<td>Lahti</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/87JyMW0t67" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Bela Vista</strong></td>
							<td>
								<ol id="passos">
							    	<li>Origem: Tecnopuc</li>
							        <li>Destino: Bela Vista/Auxiliadora, Carlos Trein/Praça da Encol</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>19:00</td>
							<td>Dani Martins</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/wNlXVAzL6N" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Bom fim</strong></td>
							<td>
								<ol>
							    	<li>Origem: Tecnopuc</li>
									<li>Destino: Castro Alves</li>
								</ol>
								<p class="sim">(*)Rota flexível? Sim</p>
								<a id="link" href="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d13814.42626985739!2d-51.18524735973117!3d-30.04814313616378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e0!4m5!1s0x951977fd79a847e5%3A0xa0f279b1e3f4bf0c!2sTECNOPUC+-+Partenon%2C+Porto+Alegre+-+RS!3m2!1d-30.060576599999997!2d-51.1708715!4m5!1s0x9519782f3fcd7331%3A0x6cfe95fc3c8daf7a!2sCarlos+Trein+Filho+-+Bela+Vista%2C+Porto+Alegre+-+RS!3m2!1d-30.034618!2d-51.185945999999994!5e0!3m2!1sen!2sbr!4v1458769235026">Click Here</a>
							</td>
							<td>Seg a Sex</td>
							<td>19:00 a 20:00</td>
							<td>Luis Mizutani</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/Jt7rddWqFn" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Canoas</strong></td>
							<td>
								<ol id="passos">
							    	<li>Origem: Tecnopuc</li>
							        <li>Destino: Canoas</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Ter a Qui</td>
							<td>Sob Consulta</td>
							<td>Youssef</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/o9oLoISHlK" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Cavalhada</strong></td>
							<td>
								<ol id="passos">
							    	<li>Origem: Tecnopuc</li>
							        <li>Destino: Cavalhada, passando pelo Praia de Belas</li>
								</ol>
								<p class="depende">(*)Rota flexível? Não</p>
							</td>
							<td>Ter a Sex</td>
							<td>19:00</td>
							<td>Marcelo Vargas</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/yIVHABCEkV" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Cidade Baixa</strong></td>
							<td>
								<ol id="passos">
							    	<li>Origem: Tecnopuc</li>
							        <li>Destino: Lima e Silva / República</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>18:00 a 19:00</td>
							<td>Andréa Aranda & Letícia Rosa</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/3zFqZS1SvR" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Lami</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Lami, via Oscar Pereria ou Lomba do Pinheiro</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>Ida para PUC(8h00) - Volta, depende do dia (consultar)</td>
							<td>Mayra Rodrigues</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/h8wRZf9hje" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Menino Deus</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Menino Deus, via Ipiranga até Érico</li>
								</ol>
								<p class="sim">(*)Rota flexível? Sim</p>
							</td>
							<td>Seg a Sex</td>
							<td>19:00 / 19:30</td>
							<td>Marcos Matos</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/rPfxpSo5Vs" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Nonoai</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Nonoai via orfanatrófio</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>19:00</td>
							<td>Jefferson Stachelsky</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/dbR9YM963H" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Oscar Pereira</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: oscar Pereira via Azenha ou Bento</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>19:00 a 20:00</td>
							<td>Marcelo Schmidt</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/hyGj1rx26x" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Petrópolis</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Rua Lavras</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>9:00</td>
							<td>Alexandre Goedert</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/dF11ctBlBT" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Santo Antônio (perto colégio La Salle)</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Santo Antônio via Bento</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg a Sex</td>
							<td>Sob consulta</td>
							<td>Rodrigo duarte & Marcus Rodrigues</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/yezpR5lzGY" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
						<tr>
							<td><strong>Sogipa</strong></td>
							<td>
				            	<ol>
				            		<li>Origem: Tecnopuc</li>
				            		<li>Destino: Sogipa, via C.Fisher, Perimetral e Assis Brasil</li>
								</ol>
								<p class="depende">(*)Rota flexível? falar c/ motorista</p>
							</td>
							<td>Seg & Qua</td>
							<td>19:00</td>
							<td>Fernanda Martins</td>
							<td><div id="button_carona"><a href="http://goo.gl/forms/iKCKMbnNX3" target="_blank">QUERO CARONA!</a></div></td>
						</tr>
					</tbody> 
				</table>
			<p></p>
			<div id="feedback">
			<h3>Nos ajude a melhorar!</h3> <a class="cadastro" href="http://goo.gl/forms/GYVDfZuhWg" target="_blank">Deixe aqui sua opinião/sugestão</a>
			</div>
		</div>
		<script type="text/javascript">
 		 $("#link").divbox({ type: 'iframe' });
		</script>
	</body>
<html>