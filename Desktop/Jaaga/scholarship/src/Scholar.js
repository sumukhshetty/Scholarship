import React from 'react';
import QRCode from 'react-qr';


class Scholar extends React.Component{
  render() {


    return (
      <div className="Scholar-section">
      <div className="Scholar-section_h2">
      <h2> Sumukh </h2>
    {      console.log("this is working")}


      <div  className="qrcode" >
        <h2> Amount :  </h2>
        <QRCode text='1HB5XMLmzFVj8ALj6mfBsbifRoD4miY36v'/>



      </div>
      <div>Description of course </div>
      </div>

      </div>
    );
  }

}

export default Scholar;
