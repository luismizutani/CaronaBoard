import { error, success } from "./helpers";
import { getProfile } from "./profile";

export default (firebase, ports) => {
  const { auth, database } = firebase;

  ports.fetchRideRequest.subscribe(ids =>
    database()
      .ref(
        "ridesRequests/" +
          ids.groupId +
          "/" +
          ids.rideId +
          "/" +
          auth().currentUser.uid +
          "/" +
          ids.fromUserId +
          "/" +
          ids.id
      )
      .once("value")
      .then(data => {
        if (data.val()) {
          const rideRequest = Object.assign({}, data.val(), {
            groupId: ids.groupId,
            rideId: ids.rideId,
            toUserId: auth().currentUser.uid,
            fromUserId: ids.fromUserId,
            id: ids.id
          });
          ports.fetchRideRequestResponse.send(success(rideRequest));
        } else {
          ports.fetchRideRequestResponse.send(
            error("Pedido de carona não encontrado")
          );
        }
      })
      .catch(err => ports.fetchRideRequestResponse.send(error(err.message)))
  );

  ports.createRideRequest.subscribe(rideRequest =>
    getProfile(firebase, ports)
      .then(profile =>
        database()
          .ref(
            "ridesRequests/" +
              rideRequest.groupId +
              "/" +
              rideRequest.rideId +
              "/" +
              rideRequest.toUserId +
              "/" +
              auth().currentUser.uid
          )
          .push({ profile: profile.val() })
      )
      .then(() =>
        ports.createRideRequestResponse.send({
          rideId: rideRequest.rideId,
          response: success(true)
        })
      )
      .catch(err =>
        ports.createRideRequestResponse.send({
          rideId: rideRequest.rideId,
          response: error(err.message)
        })
      )
  );
};
