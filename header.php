<div id="header" class="row">
    <div class="col-xs-2"><a href="index.php"><img src="img/logo.png"></a></div>
    <div class="col-xs-5">
        <form id="search-form">
                <input class="search rounded" type="text" placeholder="αναζήτηση συγγραμμάτων..." required>
                <input id="search-button" type="button" value="">
        </form>
        <div style="margin-top:10px;" data-toggle="modal" data-target="#AdvancedSearchModal"><img style="margin-left: 5px; cursor:pointer;" src="img/settings-icon.png"></div>
    </div>
    <div id=user class="dropdown col-xs-3">
        <a style="float: right; margin-top: 17px;" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
                <span id="username">guest</span><span class="caret" style="color:white"></span>
        </a>
        <ul class="dropdown-menu" style="margin-left: 125px;" role="menu" aria-labelledby="dLabel">
            <li><a href="register.php">Σύνδεση ή Εγγραφή</a></li>
        </ul>
        <img style="float: right;" src="img/user-icon.png">
    </div>

</div>



<!-- Advanced search window -->
<div class="modal fade" id="AdvancedSearchModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">Σύνθετη Αναζήτηση</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="inputRegUsername" class="col-sm-4 control-label lead blue-font" style="font-size:14px;">Τίτλος</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputAdvancedSearchTitle" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputRegUsername" class="col-sm-4 control-label lead blue-font" style="font-size:14px;">Συγγραφέας</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputAdvancedSearchTitle" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputRegUsername" class="col-sm-4 control-label lead blue-font" style="font-size:14px;">ISBN</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputAdvancedSearchTitle" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputRegUsername" class="col-sm-4 control-label lead blue-font" style="font-size:14px;">Εκδότης</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputAdvancedSearchTitle" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-5">
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                           <button type="submit" class="btn btn-primary">Σύνθετη Αναζήτηση</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<div id="mainmenu" class="row">
    <div class="row text-center" >
        <div class="col-xs-2 "><a href="index.php" class="lead mainmenu-font">Αρχική</a></div>
        <div class="col-xs-2 lead mainmenu-font">Ανακοινώσεις</div>
        <div class="col-xs-2 lead mainmenu-font">Επικοινωνία</div>
        <div class="col-xs-2 lead mainmenu-font">Χρήσιμα</div>
        <div class="col-xs-2"></div>
        <div class="col-xs-2 lead mainmenu-font" style="float:right;">
            <img src="img/rss-logo-big.png">
            <img src="img/facebook-logo-big.png">
            <img src="img/twitter-logo-big.png">
        </div>

    </div>
</div>

<div id="subtitle" class="row blue-font">
    <div class="col-xs-1" style="width:40px;">
        <div style="float:left;"><img style="height: 30; margin-top: 5px;" src="img/books.png"></div>
    </div>
    <div class="col-xs-10" >
        <div style="margin-top: 5px;" class="lead"> Ηλεκτρονική Υπηρεσία Ολοκληρωμένης Διαχείρισης Συγγραμμάτων και λοιπών βοηθημάτων</div>
    </div>
</div>
