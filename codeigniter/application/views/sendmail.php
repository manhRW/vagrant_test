<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    
    <title>Twitter</title>
    
    <link href="<?=base_url();?>resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="<?=base_url();?>resources/js/jquery.js"></script>
    <script src="<?=base_url();?>resources/js/bootstrap.min.js"></script>
    
    <style type="text/css">
        body {
            background: url("<?=base_url();?>resources/images/green-bg.jpg");
            background-size: auto auto;
            background-repeat: no-repeat;
        }
    </style>
    

</head>

<body>

    <nav class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="<?=base_url();?>index.php/twitter/homepage">Twitter</a>
        </div>
    </nav>

    <div class="container">
                      
        <div class="col-md-4">
           

            <div class="col-md-offset-4 col-md-9">                        
              <?php 
              echo form_open();
                $data_form_submit = array(
                  'type' => 'submit',
                  'name' => 'btn-send',
                  'id' => 'btn-send',
                  'class' => 'btn btn-info',
                  'value' => 'Send mail',
                  'content' => 'Send'
              );
              echo br();
              echo form_submit($data_form_submit);                
              echo br(2);
              echo form_close();
              ?>                    
            </div>
               
        </div>
        
    </div>

</body>

</html>
