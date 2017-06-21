<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Phalcon PHP Framework</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?=$this->url->get('css/style.css') ?>">
</head>

<body>

      {% if router.getControllerName() != "manage" and router.getControllerName() != "auth" %}
        <nav class="navbar navbar-toggleable-md navbar-light" style="background-color: #c3e0f5;">
          <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            {{ link_to('index','SWE', 'class': 'navbar-brand') }}

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        {{ link_to('','หน้าแรก', 'class': 'nav-link') }}
                    </li>
                    <li class="nav-item">
                        {{ link_to('user','ผู้ใช้งาน', 'class': 'nav-link') }}
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="ค้นหา">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">ค้นหา</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    {{ link_to('auth/login','เข้าสู่ระบบ', 'class': 'btn btn-outline-success btn-secondary pull-right') }}
            </div>
          </div>
        </nav>
      {% elseif router.getControllerName() == "manage"  %}

        <nav class="navbar navbar-toggleable-md navbar-inverse" style="background-color: #000;">
          <div class="container">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            {{ link_to('manage/index','Manage', 'class': 'navbar-brand') }}

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item">

                    <ul class="navbar-nav my-lg-0">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          จัดการกิจกรรม
                        </a>
                        <div class="dropdown-menu" style="float:right;" aria-labelledby="navbarDropdownMenuLink">
                          {{ link_to('manage/activitysearch','กิจกรรม' , "class": "dropdown-item") }}
                          {{ link_to('manage/locationsearch','สถานที่' , "class": "dropdown-item") }}
                        </div>
                      </li>
                    </ul>


                  </li>
                  <li class="nav-item">
                    {{ link_to('manage/teachersearch','จัดการอาจารย์', 'class': 'nav-link') }}
                  </li>
                  <li class="nav-item">
                    {{ link_to('manage/studentsearch','จัดการนักศึกษา', 'class': 'nav-link') }}
                  </li>
                </ul>
                <ul class="navbar-nav my-lg-0">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"  id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      {{ session.get("auth")['Firstname']}} {{ session.get("auth")['Lastname']}}
                    </a>
                    <div class="dropdown-menu" style="float:right;" aria-labelledby="navbarDropdownMenuLink">
                      {{ link_to('manage/profile','แก้ไขข้อมูลส่วนตัว' , "class": "dropdown-item") }}
                      {{ link_to('auth/logout','ออกจากระบบ' , "class": "dropdown-item") }}
                    </div>
                  </li>
                </ul>
            </div>
          </div>
        </nav>
      {% endif %}

    <div class="container mt-4">
      <?php $this->flashSession->output() ?>
        {{ content() }}
    </div>
    <br>
    <br>
    <br>
    <br>

    {% if router.getControllerName() != "auth" %}
      <nav class="navbar fixed-bottom navbar-light bg-faded">
        <div class="container text-right">
          <a class="navbar-brand " href="#"><small>© 2017 - software engineering @ walailak</small></a>
        </div>
      </nav>
    {% endif %}
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>

</html>
