import React, { useState } from 'react'
import {
  GoogleMap,
  Marker,
  InfoWindow,
} from '@react-google-maps/api';

const containerStyle = {
  width: '100vw',
  height: '50vh'
};

const Map = (props) => {
  const [selected, setSelected] = useState(null)

  const center = {
    lat: props.center[0],
    lng: props.center[1]
  };

  return (
    <GoogleMap
      resetBoundsOnResize={true}
      mapContainerStyle={{ width: '70vw', height: '100vh' }}
      center={center}
      zoom={props.zoom}
    >
      {props.markers[0].map(marker =>
        <Marker
          key={marker.id}
          animation={2}
          position={{
            lat: marker.lat,
            lng: marker.lng,
          }}
          onClick={() => {
            setSelected(marker)
          }}
        />
      )}

      {selected ?
        (<InfoWindow
            position={{ lat: selected.lat, lng: selected.lng }}
            onCloseClick={() => {
              setSelected(null)
            }}
          >
          <div style={{ maxWidth: 120 }}>
            <p>{ selected.name }</p>
            <small>{ selected.address }</small>
          </div>
        </InfoWindow>) : null
      }
    </GoogleMap>
  )
}

export default React.memo(Map)