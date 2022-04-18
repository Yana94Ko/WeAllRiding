// TODO: Activate caret active animation
class CpcNavigation extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      jsxData: [],
      submenu: [] };

  }

  componentDidMount() {
    this.setState({ jsxData: this.createMenuJSX() });
  }

  menuClickEvent(i) {
    let submenu = this.state.submenu;
    let tmpmenu = submenu[i];
    let sub = tmpmenu.sub.current;
    let caret = tmpmenu.caret.current;

    if (tmpmenu.active === false) {
      tmpmenu.active = true;

      TweenLite.to(caret, 1, {
        transform: 'rotate(180deg)',
        ease: Elastic.easeOut.config(1, 0.3) });


      TweenLite.to(sub, 1, {
        height: sub.scrollHeight,
        visibility: 'visible',
        ease: Elastic.easeOut.config(1, 0.3) });

    } else {
      tmpmenu.active = false;

      TweenLite.to(caret, 1, {
        transform: 'rotate(0deg)',
        ease: Elastic.easeOut.config(1, 0.3) });


      TweenLite.to(sub, 0.5, {
        height: 0,
        ease: Bounce.easeOut }).
      eventCallback('onComplete', () => {
        TweenLite.to(sub, 0, {
          visibility: 'hidden' });

      });
    }

    submenu[i] = tmpmenu;

    this.setState({ submenu: submenu });
  }

  createMenuJSX(menu = this.props.menu) {
    let link = [];

    for (let i in menu) {
      let m = menu[i];
      let ic = React.createElement("i", { className: "cpc-icon cpc-hidden fas fa-caret-down" });

      if (typeof m.icon !== 'undefined') {
        ic = React.createElement("i", { className: 'cpc-icon ' + m.icon });
      }

      if (typeof m.menu === 'undefined') {
        link.push(
        React.createElement("li", null,
        React.createElement("a", { href: m.link },
        ic,
        React.createElement("span", null, i),
        React.createElement("i", { className: "cpc-caret cpc-hidden fas fa-caret-down" }))));



      } else if (typeof m.menu === 'object') {
        let tmpSubmenu = this.state.submenu;
        let tmpLength = tmpSubmenu.length;

        tmpSubmenu.push({
          'id': m.link,
          'active': false,
          'caret': React.createRef(),
          'sub': React.createRef() });


        link.push(
        React.createElement("li", null,
        React.createElement("a", {
          href: m.link,
          onClick: this.menuClickEvent.bind(this, tmpLength) },

        ic,
        React.createElement("span", null, i),
        React.createElement("i", {
          className: "cpc-caret fas fa-caret-down",
          ref: tmpSubmenu[tmpLength].caret })),


        React.createElement("ul", { className: "cpc-sub", ref: tmpSubmenu[tmpLength].sub },
        this.createMenuJSX(m.menu))));




        this.setState({ submenu: tmpSubmenu });
      }
    }

    return link;
  }

  render() {
    return (
      React.createElement("nav", { className: "cpc-menu" },
      React.createElement("ul", { className: "cpc-main" },
      this.state.jsxData)));



  }}
// Navigation menu builder
const menu = {
  '코스': {
    'link': '#',
    'icon': 'fas fa-road',
    'menu': {
      '추천 코스': {
        'link': '/recommendView'
        },

      '코스 만들기': {
        'link': '/courseCreate'
        },
	 	} 
	 },

  '라이딩': {
    'link': '#',
    'icon': 'fas fa-biking',
    'menu': {
      '라이딩 리스트': {
        'link': '/riding/ridingList'
        },

      '라이딩 개설하기': {
        'link': '/riding/ridingWrite'
        },

      'My 라이딩': {
        	'link': '/riding/myRidingList'
       	 } 
   	 } 
    },
	'정비샵': {
	    'link': '/shopView',
	    'icon': 'fas fa-tools' },

  '커뮤니티': {
    'link': '/comty/comtyList',
    'icon': 'fas fa-comment-dots' },
    
  '이상형 월드컵': {
    'link': '/idealView',
    'icon': 'fas fa-dice-five' },
    };



ReactDOM.render(
React.createElement(CpcNavigation, { menu: menu }),
document.querySelector('#app'));