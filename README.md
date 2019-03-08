# Xcode

Markdown Example
=======

Base
-----

### 1 Special Characters 特殊字符

* `&lt;`  = &lt;

* `&amp;`  =  &amp;

* `&copy;`  = &copy;

### 2 Phrase Emphasis 强调

+ *italic*   
+ **bold**  
+ _italic_  
+ __bold__

### 3 Links 链接

* An [example](https://spec.commonmark.org "Title")

* An [example][id]. Then, anywhere else in the doc, define the link: 

  [id]: https://spec.commonmark.org  "Title"

### 4 Images 图片

* ![alt text](http://img4.duitang.com/uploads/item/201508/19/20150819131018_vYPyR.thumb.224_0.png "Title")

* ![alt text][img]  

   [img]: http://img4.duitang.com/uploads/item/201508/19/20150819131018_vYPyR.thumb.224_0.png "Title"

### 5 Headers  标题

* setext headings.

This is an H1
===========

This is an H2
-------------

* Atx-style headers use 1-6 hash characters at the start of the line, corresponding to header levels 1-6.

# This is an H1

## This is an H2

###### This is an H6
    
### 6 Lists 列表

1. Number  
    1.  Foo  
    2.  Bar

2. \* \+ \- Charaters  
    * Abacus  
    + answer  
    - Bubbles

### 7 Blockquotes 块引用

> Email-style angle brackets
> are used for blockquotes.

> > And, they can be nested.

> ### Headers in blockquotes
> 
> * You can quote a list.
> * Etc.

### 8 Code  Spans 行内代码

* `code`  spans are delimited by backticks.

* ``` codde```  spans are delimited by backticks.

### 9 Preformatted Code  代码区块

indent every line of a code block by at least 4 spaces or 1 tab.

This is a normal paragraph.

    This is a preformatted code block.

### 10 Horizontal 分隔线

*  \--- ,\***  ,\- - -

---   
***  
- - -

### 11 Manual Line 换行

End a line with two or more spaces

Roses are red,   
Violets are blue.

Markdown Common
-----

###  Lists Extra

* add ) Charaters
1)  Foo  
1)  Foo  

### Preformatted Code Extra

 ```
  hello world
  spans are delimited by backticks.
```  

GitHub Flavored Markdown
-----

### Syntax highlighting 语法高亮

```javascript
    function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    }
```
### Task Lists  任务列表

- [x] Finish my changes
- [ ] Push my commits to GitHub
- [ ] \(Optional) Open a followup issue

### Tables 表格

| Left-Aligned | Center Aligned | Right Aligned |  
| :------------ |:---------------:| -----:|
| col 3 is | some wordy text | $1600 |  
| col 2 is | centered | $12 |   
| zebra stripes | are neat | $1 |  

### Automatic linking for URLs

* http://www.github.com/  
  164804868@qq.com

* <http://www.github.com>  
  <164804868@qq.com>

### Strikethrough

 ~~This was mistaken text~~

### Emoji

* :EMOJICODE: [emoji-cheat-sheet](http://emoji-cheat-sheet.com/)

:blush:
:joy:
:grinning:

