
package entity;

public class Category {
//    ID [int] primary key,
//   [name] nvarchar(30) ,
//   describe nvarchar(50), 
    private int category_id;
    private String name,describe;

    public Category() {
    }

    public Category(int category_id, String name, String describe) {
        this.category_id = category_id;
        this.name = name;
        this.describe = describe;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
    
}
