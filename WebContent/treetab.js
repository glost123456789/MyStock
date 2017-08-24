 Ext.onReady(function(){
 // 左边的菜单
  var menu = new Ext.tree.TreePanel({
  title: '功能菜单',
  region: "west",
  autoScroll: true,
  enableTabScroll: true,
  collapsible: true,
  //collapsed: true,//菜单初始化时自动隐藏
  iconCls: 'plugin',
  split: true,
  rootVisible: false,
  lines: true,//节点间的虚线条
  width: 220,
  minSize: 220,
  maxSize: 220,
  loader: new Ext.tree.TreeLoader({
  dataUrl: 'user_getMenuBuf.do'
  }),
  root: new Ext.tree.AsyncTreeNode({
  id: '0', // 注意这个0是约定
  level: '0',
  expanded: true,
  text: '功能菜单',
  leaf: false
  })
  });

  menu.on('click', function (node) {
  if (node.leaf == true) {
  var tab = tabMain.getComponent('tab_' + node.id);
  if (!tab) {
  tab = new Ext.Panel({
  id: 'tab_' + node.id,
  closable: true,
  title: node.text,
  iconCls: node.attributes.iconCls,
  autoScroll: true,
  border: false,
  //layout: 'fit',
  autoLoad: {
  url: 'jsp/jinhuo/jinhuo.jsp',
  scope: this,
  method: 'get', //post or get
  params: { subMainId: node.id }, //传值
  scripts: true, //支持页面所有的dom元素
  text: '页面加载中，请稍候....'
  }
  })
  tabMain.add(tab);
  }
  tabMain.setActiveTab(tab);
  //alert(node.attributes.link);
  }
  });

  //加载时自动展开根节点
  menu.expandAll();

  // 主显示区
  var tabMain = new Ext.TabPanel({
  id: "Main_MasterPage_TabMain",
  region: "center",
  autoScroll: true,
  enableTabScroll: true,//如果Tab过多会出现滚动条
  activeTab: 0,
  initEvents: function () {
  Ext.TabPanel.superclass.initEvents.call(this);
  this.mon(this.strip, {
  scope: this,
  mousedown: this.onStripMouseDown,
  contextmenu: this.onStripContextMenu
  });
  if (this.enableTabScroll) {
  this.mon(this.strip, 'mousewheel', this.onWheel, this);
  }
  this.mon(this.strip, 'dblclick', this.onTitleDbClick, this);
  },
  onTitleDbClick: function (e, target, o) {
  var t = this.findTargets(e);
  if (t.item) {
  if (t.item.closable) {
  if (t.item.fireEvent('beforeclose', t.item) !== false) {
  t.item.fireEvent('close', t.item);
  this.remove(t.item);
  }
  }
  }
  },
  items: [new Ext.Panel({
  id: 'tab-0001',
  title: '首页',
  autoScroll: true,
  layout: 'fit',
  border: false,
  iconCls: 'house',
  autoLoad: {
  url: 'demo.jsp',
  scope: this,
  scripts: true,
  text: '页面加载中,请稍候....'
  }
  })]
  });

  // 创建框架
  new Ext.Viewport({
  id: "Main_MasterPage_ViewPort",
  layout: 'border',
  items: [tabMain, menu]
  });
  
  });