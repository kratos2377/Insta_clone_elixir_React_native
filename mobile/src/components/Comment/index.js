import React, { PureComponent } from 'react';
import { View, Text, StyleSheet, Image , TouchableOpacity } from 'react-native';
import Ionicons from 'react-native-vector-icons/Ionicons';
import formatDistanceToNow from 'date-fns';
import { human, systemWeights, iOSColors } from 'react-native-typography';

import { makeCircle, centerElement } from '../../utils/themes';

class Comment extends PureComponent {
  state = {};
  render() {
    const {
      user: { avatar, username },
      text,
      insertedAt,
    } = this.props;
    return (
      <View style={styles.root}>
        <View style={styles.avatarWrapper}>
          <Image style={styles.avatar} source={{ uri: avatar }} />
        </View>
        <View style={styles.contentWrapper}>
          <View>
            <Text style={styles.body}>
              <Text style={systemWeights.bold}>{username}</Text> {text}
            </Text>
          </View>
          <View style={styles.dateWrapper}>
            <Text style={styles.date}>
              {formatDistanceToNow(insertedAt)} ago
            </Text>
          </View>
        </View>
        <TouchableOpacity feedback="opacity" style={styles.buttonWrapper}>
          <Ionicons name="ios-heart-outline" size={15} />
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  root: {
    minHeight: 70,
    flexDirection: 'row',
  },
  avatarWrapper: {
    flex: 0.2,
    ...centerElement,
  },
  contentWrapper: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'flex-start',
  },
  buttonWrapper: {
    flex: 0.2,
    ...centerElement,
  },
  avatar: {
    ...makeCircle(30),
  },
  body: {
    ...systemWeights.thinObject,
    ...human.footnoteObject,
  },
  dateWrapper: {
    marginTop: 5,
  },
  date: {
    ...systemWeights.thinObject,
    ...human.caption1Object,
    color: iOSColors.midGray,
  },
});

export default Comment;
