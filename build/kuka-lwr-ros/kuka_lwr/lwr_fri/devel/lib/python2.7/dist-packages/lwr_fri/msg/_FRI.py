# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from lwr_fri/FRI.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class FRI(genpy.Message):
  _md5sum = "1c34faf79d9377b5acf8f04748e1f1a2"
  _type = "lwr_fri/FRI"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header
string[] name
float64[] position
float64[] effort
float64[] stiffness
float64[] damping
int64 FRI_STATE
int64 FRI_QUALITY
int64 FRI_CTRL
int64 ROBOT_CTRL_MODE
bool IsRobotArmPowerOn
bool DoesAnyDriveSignalAnError

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
"""
  __slots__ = ['header','name','position','effort','stiffness','damping','FRI_STATE','FRI_QUALITY','FRI_CTRL','ROBOT_CTRL_MODE','IsRobotArmPowerOn','DoesAnyDriveSignalAnError']
  _slot_types = ['std_msgs/Header','string[]','float64[]','float64[]','float64[]','float64[]','int64','int64','int64','int64','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,name,position,effort,stiffness,damping,FRI_STATE,FRI_QUALITY,FRI_CTRL,ROBOT_CTRL_MODE,IsRobotArmPowerOn,DoesAnyDriveSignalAnError

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(FRI, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.name is None:
        self.name = []
      if self.position is None:
        self.position = []
      if self.effort is None:
        self.effort = []
      if self.stiffness is None:
        self.stiffness = []
      if self.damping is None:
        self.damping = []
      if self.FRI_STATE is None:
        self.FRI_STATE = 0
      if self.FRI_QUALITY is None:
        self.FRI_QUALITY = 0
      if self.FRI_CTRL is None:
        self.FRI_CTRL = 0
      if self.ROBOT_CTRL_MODE is None:
        self.ROBOT_CTRL_MODE = 0
      if self.IsRobotArmPowerOn is None:
        self.IsRobotArmPowerOn = False
      if self.DoesAnyDriveSignalAnError is None:
        self.DoesAnyDriveSignalAnError = False
    else:
      self.header = std_msgs.msg.Header()
      self.name = []
      self.position = []
      self.effort = []
      self.stiffness = []
      self.damping = []
      self.FRI_STATE = 0
      self.FRI_QUALITY = 0
      self.FRI_CTRL = 0
      self.ROBOT_CTRL_MODE = 0
      self.IsRobotArmPowerOn = False
      self.DoesAnyDriveSignalAnError = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.name)
      buff.write(_struct_I.pack(length))
      for val1 in self.name:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.position)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.position))
      length = len(self.effort)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.effort))
      length = len(self.stiffness)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.stiffness))
      length = len(self.damping)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.damping))
      _x = self
      buff.write(_get_struct_4q2B().pack(_x.FRI_STATE, _x.FRI_QUALITY, _x.FRI_CTRL, _x.ROBOT_CTRL_MODE, _x.IsRobotArmPowerOn, _x.DoesAnyDriveSignalAnError))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.name = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.name.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.position = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.effort = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.stiffness = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.damping = struct.unpack(pattern, str[start:end])
      _x = self
      start = end
      end += 34
      (_x.FRI_STATE, _x.FRI_QUALITY, _x.FRI_CTRL, _x.ROBOT_CTRL_MODE, _x.IsRobotArmPowerOn, _x.DoesAnyDriveSignalAnError,) = _get_struct_4q2B().unpack(str[start:end])
      self.IsRobotArmPowerOn = bool(self.IsRobotArmPowerOn)
      self.DoesAnyDriveSignalAnError = bool(self.DoesAnyDriveSignalAnError)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.name)
      buff.write(_struct_I.pack(length))
      for val1 in self.name:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.position)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.position.tostring())
      length = len(self.effort)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.effort.tostring())
      length = len(self.stiffness)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.stiffness.tostring())
      length = len(self.damping)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.damping.tostring())
      _x = self
      buff.write(_get_struct_4q2B().pack(_x.FRI_STATE, _x.FRI_QUALITY, _x.FRI_CTRL, _x.ROBOT_CTRL_MODE, _x.IsRobotArmPowerOn, _x.DoesAnyDriveSignalAnError))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.name = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.name.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.position = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.effort = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.stiffness = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.damping = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      _x = self
      start = end
      end += 34
      (_x.FRI_STATE, _x.FRI_QUALITY, _x.FRI_CTRL, _x.ROBOT_CTRL_MODE, _x.IsRobotArmPowerOn, _x.DoesAnyDriveSignalAnError,) = _get_struct_4q2B().unpack(str[start:end])
      self.IsRobotArmPowerOn = bool(self.IsRobotArmPowerOn)
      self.DoesAnyDriveSignalAnError = bool(self.DoesAnyDriveSignalAnError)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4q2B = None
def _get_struct_4q2B():
    global _struct_4q2B
    if _struct_4q2B is None:
        _struct_4q2B = struct.Struct("<4q2B")
    return _struct_4q2B
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
