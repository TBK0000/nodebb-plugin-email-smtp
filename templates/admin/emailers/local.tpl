<h1><i class="fa fa-envelope-o"></i> Mail Service (SMTP)</h1>

<div class="row">
	<div class="col-lg-12">
		<blockquote>
			Send e-mail via SMTP
		</blockquote>
	</div>
</div>

<hr />

<form role="form" class="emailer-local-settings">
	<fieldset>
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:host">Host</label>
					<input type="text" class="form-control" id="emailer:local:host" name="emailer:local:host" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:port">Port</label>
					<input type="text" class="form-control" value="25" id="emailer:local:port" name="emailer:local:port" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:username">Username</label>
					<input type="text" class="form-control" id="emailer:local:username" name="emailer:local:username" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label for="emailer:local:password">Password</label>
					<input type="password" class="form-control" id="emailer:local:password" name="emailer:local:password" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>
						<input type="checkbox" id="emailer:local:secure" name="emailer:local:secure"/>
						 Secure connection
					</label>
				</div>
			</div>
		</div>

		<button class="btn btn-lg btn-primary" id="save">Save</button>
	</fieldset>
</form>

<script type="text/javascript">
	require(['settings'], function(Settings) {
		Settings.load('emailer-local', $('.emailer-local-settings'));

		$('#save').on('click', function() {
			Settings.save('emailer-local', $('.emailer-local-settings'), function() {
				app.alert({
					alert_id: 'emailer-local',
					type: 'info',
					title: 'Settings changed',
					message: 'Please reload for these changes to take effect',
					timeout: 5000,
					clickfn: function() {
						socket.emit('admin.reload');
					}
				});
			});
		});
	});
</script>
