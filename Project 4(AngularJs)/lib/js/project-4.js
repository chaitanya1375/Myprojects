var app = angular.module("myapp", []);

app.controller('myctrl', ['$scope', function($scope) {
    $scope.total = 0.0;
    $scope.count = 0;
    $scope.selectedItem = "HOME";
    $scope.menuItems = ["HOME", "PROJECTS", "SERVICES", "CONTACT"];
    $scope.addedList = [];
    $scope.home = true;
    $scope.projects = [{ "title": "Web Development", "price": 300 },
        { "title": "Design", "price": 400 }, { "title": "Integration", "price": 250 }, { "title": "Training", "price": 220 }
    ];

//Function to add and subtract the selected fields
    $scope.addFunc = function(p) {
        if ($scope.addedList.length == 0) {
            $scope.total = $scope.total + p;
            $scope.addedList.push(p);
        } else {
            for (var i = 0; i < $scope.addedList.length; i++) {
                if (p == $scope.addedList[i]) {
                    $scope.count = $scope.count + 1;
                }
            }
            if ($scope.count == 0) {
                $scope.total = $scope.total + p;
                $scope.addedList.push(p);
            } else {
                $scope.total = $scope.total - p;
                var index = $scope.addedList.indexOf(p);
                $scope.addedList.splice(index, 1);
            }
            $scope.count = 0;
        }
    };

//To show the respective menu when clicked on the navigation bar
    $scope.activeMenu = $scope.menuItems[0];
    $scope.setActive = function(menuItem) {
        $scope.activeMenu = menuItem;
        $scope.selectedItem = menuItem;
        if (menuItem === "HOME") {
            $scope.home = true;
            $scope.project = false;
            $scope.contact = false;
            $scope.services = false;
            $scope.projects = [{ "title": "Web Development", "price": 300 },
                { "title": "Design", "price": 400 }, { "title": "Integration", "price": 250 }, { "title": "Training", "price": 220 }
            ];
        }
        if (menuItem === "PROJECTS") {
            $scope.home = false;
            $scope.project = true;
            $scope.contact = false;
            $scope.services = false;
        }
        if (menuItem === "SERVICES") {
            $scope.home = false;
            $scope.project = false;
            $scope.contact = false;
            $scope.services = true;
        }
        if (menuItem === "CONTACT") {
            $scope.home = false;
            $scope.project = false;
            $scope.contact = true;
            $scope.services = false;
        }

    }


}])
