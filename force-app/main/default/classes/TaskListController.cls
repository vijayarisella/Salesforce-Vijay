public with sharing class TaskListController{

    public String totalPages { get; set; }

    public String pageNumber { get; set; }

 // Pagination 
public PageReference save() {
    return null;
}
public PageReference edit() {
    return null;
}
    private integer counter=0;  //keeps track of the offset
    private integer list_size=3; //sets the page size or number of rows
    public integer total_size; //used to show user the total size of the list
    public string selectedPage{get;set{selectedPage=value;}
}
 public TaskListController() {
    total_size = [select count() from Task]; //set the total size in the constructor
    selectedPage='0';
}
public Task[] getTasks() {
   if (selectedPage != '0') counter = list_size*integer.valueOf(selectedPage)-list_size;
    try {
         Task[] taskList = [select Id,Subject, Status, Description from Task where Subject like : '%'+searchText+'%' OR Status like : '%'+searchText+'%' Order By Subject,Status limit :list_size offset :counter];                  
          return taskList;
        } catch (QueryException e) {                           
            ApexPages.addMessages(e);                  
            return null;
    }       
}
public Component.Apex.pageBlockButtons getMyCommandButtons() {
   //the reRender attribute is a set NOT a string
    Set<string> theSet = new Set<string>();
    theSet.add('myPanel');
    theSet.add('myButtons');

    integer totalPages;
    if (math.mod(total_size, list_size) > 0) {
        totalPages = total_size/list_size + 1;
    } else {
        totalPages = (total_size/list_size);
    }
     integer currentPage;       
    if (selectedPage == '0') {
        currentPage = counter/list_size + 1;
    } else {
        currentPage = integer.valueOf(selectedPage);
    }
    Component.Apex.pageBlockButtons pbButtons = new Component.Apex.pageBlockButtons();       
    pbButtons.location = 'top';
    pbButtons.id = 'myPBButtons';
    Component.Apex.outputPanel opPanel = new Component.Apex.outputPanel();
    opPanel.id = 'myButtons';

   
      //add all buttons as children of the outputPanel               
    pbButtons.childComponents.add(opPanel); 
   return pbButtons;
  }   
   public PageReference refreshGrid() { //user clicked a page number       
    system.debug('**** ' + selectedPage);
    return null;
   }

  // Search functionality 

   public apexpages.standardController controller{get;set;}
   public Task l;
   public List<Task> searchResults {get; set; }

   public string searchText
   {
   get
   {
     if (searchText==null) searchText = '';
     return searchText;
   }
  set;
   }
 public TaskListController(ApexPages.StandardController controller)
 {
    this.controller = controller;
    this.l = (Task) controller.getRecord();
  }

public PageReference search()
{
  if(SearchResults == null)
  {
    SearchResults = new List<Task>();
  }
 else
 {
    SearchResults.Clear();
 }
    String qry ='Select Id, Subject,Status from Task where Subject like  \'%'+searchText+'%\' OR Status like \'%'+searchText+'%\' Order By Subject,Status';

 SearchResults = Database.query(qry);
 searchResults.sort();
 //System.debug(SearchResults);
 return null;
   }
  }